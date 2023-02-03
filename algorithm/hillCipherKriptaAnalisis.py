import numpy as np


def moduloInverse(dividend, divisor):
    return pow(dividend,-1,divisor)

def matrixInverseModulo(matrix, divisor):
    # inisiasi
    inverseDet = None
    res = np.array([])
    # cek panjang matrix (buat penyesuaian method invers)
    if (len(matrix) == 2):
        # dapatkan det(matrix)
        det = matrix[0][0]*matrix[1][1] - matrix[1][0]*matrix[0][1]
        # inverse Det dengan divisor
        inverseDet = moduloInverse(det, divisor)
        # matriks
        res = np.array([ [matrix[1][1], -matrix[0][1]], [-matrix[1][0], matrix[0][0]] ])

    if (len(matrix) == 3):
        # method crammer
        A = matrix[1][1]*matrix[2][2] - matrix[2][1]*matrix[1][2]
        B = -(matrix[1][0]*matrix[2][2] - matrix[1][2]*matrix[2][0])
        C = matrix[1][0]*matrix[2][1] - matrix[1][1]*matrix[2][0]
        D = -(matrix[0][1]*matrix[2][2] - matrix[2][1]*matrix[0][2])
        E = matrix[0][0]*matrix[2][2]-matrix[0][2]*matrix[2][0]
        F = -(matrix[0][0]*matrix[2][1] - matrix[0][1]*matrix[2][0])
        G = matrix[0][1]*matrix[1][2] - matrix[1][1]*matrix[0][2]
        H = -(matrix[0][0]*matrix[1][2] - matrix[0][2]*matrix[1][0])
        I = matrix[0][0]*matrix[1][1] - matrix[0][1]*matrix[1][0]
        # dapatkan det(matrix)
        det = matrix[0][0]*A + matrix[0][1]*B + matrix[0][2]*C
        # inverse Det dengan divisor
        inverseDet = moduloInverse(det, divisor)
        # matriks
        res = np.array([ [A, D, G], [B, E, H], [C, F, I] ])
        

    return (inverseDet*res).astype(int)

m = np.array([[437,249,302],[793,543,533],[602,499,495]])%26

m1 = np.array([[7,11,0],[4,14,15],[11,2,19]])

m3 = np.array([[420,545,500],[467,584,535],[484,567,550]])%26

p1 = [[7,11,0],[4,14,15],[11,2,19]]

# print(matrixInverseModulo(p1,26)%26)

p2 = [[0,7,3],[8,0,14],[13,3,2]]

# print(matrixInverseModulo(p2,26)%26)

p3 = [[4,14,15],[11,2,19],[11,0,0]]
# print(matrixInverseModulo(p3,26)%26)

p4 = [[11,2,19],[11,0,0],[14,15,8]]
# print(matrixInverseModulo(p4,26)%26)

p5 = [[11,0,0],[14,15,8],[2,19,13]]
# print(matrixInverseModulo(p5,26)%26)

p6 = [[14,15,8],[2,19,13],[0,0,7]]
# print(matrixInverseModulo(p6,26)%26)

p7 = [[2,19,13],[0,0,7],[15,8,0]]
# print(matrixInverseModulo(p7,26)%26)

print(m1)