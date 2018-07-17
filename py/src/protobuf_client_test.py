
import grpc
import priv.protos.hellostreamingworld_pb2_grpc as hellostreamingworld_pb2_grpc
import priv.protos.hellostreamingworld_pb2 as hellostreamingworld_pb2
import priv.protos.matrix_op_pb2_grpc as matrix_op_pb2_grpc
import priv.protos.matrix_pb2 as matrix_pb2


def gen_multi_greetings():
    for name, num in [('Joe', '2'), ('Tompthan', '3')]:
        yield hellostreamingworld_pb2.HelloRequest(name=name, num_greetings=num)

def gen_matrix():
    yield matrix_pb2.Matrix(e = list(range(1,10)), col = 3, row = 3)


def run():
    channel = grpc.insecure_channel('localhost:50051')
    #stub = hellostreamingworld_pb2_grpc.MultiGreeterStub(channel)

    #responses = stub.SayHello(gen_multi_greetings())

    matrix_stub = matrix_op_pb2_grpc.MatrixOpStub(channel)
    responses = matrix_stub.Echo(gen_matrix())

    print(responses)
    for response in responses:
        print(response.e)
        print(response.col, response.row)

if __name__ == '__main__':
    run()