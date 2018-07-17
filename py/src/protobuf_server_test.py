#from say_hello_pb2 import HelloRequest, HelloResponse

# request = HelloRequest()
# request.function_name = 'hello'
# request.person_name = 'Joe'

from concurrent import futures
import time

import grpc

import numpy as np

import priv.protos.helloworld_pb2 as helloworld_pb2
import priv.protos.helloworld_pb2_grpc as helloworld_pb2_grpc
import priv.protos.hellostreamingworld_pb2 as hellostreamingworld_pb2
import priv.protos.hellostreamingworld_pb2_grpc as hellostreamingworld_pb2_grpc
import priv.protos.matrix_pb2 as matrix_pb2
import priv.protos.matrix_op_pb2_grpc as matrix_op_pb2_grpc
import priv.protos.python_shell_pb2 as python_shell_pb2
import priv.protos.python_shell_pb2_grpc as python_shell_pb2_grpc

from compute.matrix import request_to_matrix, matrix_to_request, matrix_op

_ONE_DAY_IN_SECONDS = 60 * 60 * 24


class Greeter(helloworld_pb2_grpc.GreeterServicer):

    def SayHello(self, request, context):
        return helloworld_pb2.HelloReply(message='Hello, %s!' % request.name)


class MultiGreeter(hellostreamingworld_pb2_grpc.MultiGreeterServicer):
    def SayHello(self, request_iterator, context):
        print('hello')
        print(request_iterator)
        request = next(request_iterator)

        print((request.num_greetings, request.name))

        for request in request_iterator:
            print(request)
            for i in range(int(request.num_greetings)):
                print('%d ' % (i))
                yield hellostreamingworld_pb2.HelloReply(message='Times: %s Hello, %s ' % (request.num_greetings, request.name))

class MatrixOp(matrix_op_pb2_grpc.MatrixOpServicer):
    def Echo(self, request_iterator, context):
        for request in request_iterator:
            arr = request_to_matrix(request)
            print(arr)

            yield matrix_pb2.Matrix(**matrix_to_request(arr))
    
    def Op(self, request, context):
        matrix_list = list(map(request_to_matrix, request.matrixs))

        m_result = matrix_op(matrix_list, request.op)

        return matrix_pb2.MatrixList(matrixs = [matrix_pb2.Matrix(**matrix_to_request(m_result))])



class PythonShell(python_shell_pb2_grpc.PythonShellServicer):
    def Eval(self, request, context):
        exec(request.exec)
        result = str(eval(request.eval))

        return python_shell_pb2.StringValue(value=result)


def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    helloworld_pb2_grpc.add_GreeterServicer_to_server(Greeter(), server)
    hellostreamingworld_pb2_grpc.add_MultiGreeterServicer_to_server(MultiGreeter(), server)
    matrix_op_pb2_grpc.add_MatrixOpServicer_to_server(MatrixOp(), server)
    python_shell_pb2_grpc.add_PythonShellServicer_to_server(PythonShell(), server)

    server.add_insecure_port('[::]:50051')
    server.start()
    try:
        while True:
            time.sleep(_ONE_DAY_IN_SECONDS)
    except KeyboardInterrupt:
        server.stop(0)


if __name__ == '__main__':
    serve()
