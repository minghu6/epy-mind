

import numpy as np

def request_to_matrix(matrix_request):
    return np.array(matrix_request.e).reshape(matrix_request.col, matrix_request.row)

def matrix_to_request(matrix):
    e = matrix.reshape(1, matrix.size).tolist()[0]
    row, col = matrix.shape

    return {'e':e, 'row':row, 'col':col}

def matrix_multiple(matrix_a, matrix_b):
    return matrix_a @ matrix_b


def matrix_op(matrix_list, op):
    if op.value == 'multiple':
        return matrix_multiple(*matrix_list[:2])

# def multiple(matrix_list_a, matrix_list_b):

#     return [np.multiply(matrix_a, matrix_list_b)
#             for matrix_a, matrix_b in zip(matrix_list_a, matrix_list_b)]