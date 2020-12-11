def jacobi(A,B=None,N=None,e=None):
    """calc eigenvalues for input matrix
    Prerequisite:
        A: strictly or irreducibly diagonally dominant

    Solve:
        AX = B

    parameter:
        A: input square matrix
        B: fit matrix, default None
        N: iteration, default 20
        e: tolerance, default 0.000001

    Return:
        N: iteration
        v: 1D list, eigenvalues

    Errors:
        0 & empty list, (0,[])
    """
    bo = False
    if len(A) == 0:
        print('Warning: empty input')
        bo = True
        if not bo:
            t = [len(i) for i in A]
            if len(set(t)) != 1:
                print('Warning: input A has to be square')
                bo = True
    if bo:
        return 0,[]

    T = len(A)
    if B is None: B = [0.0 for i in range(T)]
    if N is None: N = 20
    if e is None: e = 0.000001
    v = [1.0 for i in range(T)]
    for it in range(N):
        bo = True
        vnew = [0 for i in range(T)]
        for i in range(T):
            s = 0.0
            for j in range(T):
                if i != j:
                    s += A[i][j]*v[j]
            vnew[i] = (B[i]-s)/A[i][i]
            if abs(vnew[i]-v[i]) > e:
                bo = False
        v = vnew
        if bo:
            break
    return it+1, v


def gaussSeidel(A,B=None,N=None,e=None):
    """calc eigenvalues for input matrix
    Prerequisite:
        A: strictly or irreducibly diagonally dominant

    Solve:
        AX = B

    parameter:
        A: input square matrix
        B: quation matrix, default None
        N: iteration, default 20
        e: tolerance, default 0.000001

    Return:
        N: iteration
        v: 1D list, eigenvalues

    Errors:
        0 & empty list, (0,[])
    """
    bo = False
    if len(A) == 0:
        print('Warning: empty input')
        bo = True
        if not bo:
            t = [len(i) for i in A]
            if len(set(t)) != 1:
                print('Warning: input A has to be square')
                bo = True
    if bo:
        return 0,[]

    T = len(A)
    if B is None: B = [0.0 for i in range(T)]
    if N is None: N = 20
    if e is None: e = 0.000001
    v = [1.0 for i in range(T)]
    for it in range(N):
        bo = True
        for i in range(T):
            s = 0.0
            for j in range(T):
                if j != i:
                    s += A[i][j] * v[j]
            tmp = (B[i]-s)/A[i][i]
            if abs(tmp-v[i]) > e:
                bo = False
            v[i] = tmp
        if bo:
            break
    return it+1, v



def test_jacobi():
    """test jacobi"""
    def is_equal(S,V):
        """return True if two input matrix 1D are equal"""
        if len(S) != len(V): return False
        for i in range(len(S)):
            if round(S[i]-V[i],5) != 0.0:
                return False
        return True
    
    A = [[-5,-2,3],[-3,9,1],[2,-1,7]]
    B = [-1,2,3]
    it,S = jacobi(A,B=B)
    # expected
    V = [0.313873, 0.284672, 0.379560]
    if not is_equal(S,V):
        print('Error on test for < jacobi >, test-1')

    A = [[2,1],[5,7]]
    B = [11,13]
    # note, increase iterations
    it,S = jacobi(A,B=B,N=100)
    # expected
    V = [7.111111,-3.222222]
    if not is_equal(S,V):
        print('Error on test for < jacobi >, test-2')
    
    A = [
        [173, 22, 11, 48, 62, 13],
        [29, 192, 16, 21, 76, 41],
        [17, 11, 154, 7, 21, 15],
        [31, 6, 13, 141, 42, 13],
        [51, 27, 8, 17, 158, 67],
        [19, 12, 63, 19, 31, 172]
    ]
    B = [-706, 1148, -1779, 701, 1339, 1238]
    # note, increase iterations
    it,S = jacobi(A,B=B,N=100)
    # expected
    V = [-8,3,-13,5,6,11]
    if not is_equal(S,V):
        print('Error on test for < jacobi >, test-3')



def test_gaussSeidel():
    """test jacobi"""
    def is_equal(S,V):
        """return True if two input matrix 1D are equal"""
        if len(S) != len(V): return False
        for i in range(len(S)):
            if round(S[i]-V[i],5) != 0.0:
                return False
        return True
    
    A = [[-5,-2,3],[-3,9,1],[2,-1,7]]
    B = [-1,2,3]
    it,S = gaussSeidel(A,B=B)
    # expected
    V = [0.313873, 0.284672, 0.379560]
    if not is_equal(S,V):
        print('Error on test for < gaussSeidel >, test-1')

    A = [[2,1],[5,7]]
    B = [11,13]
    it,S = gaussSeidel(A,B=B)
    # expected
    V = [7.111111,-3.222222]
    if not is_equal(S,V):
        print('Error on test for < gaussSeidel >, test-2')
    
    A = [
        [173, 22, 11, 48, 62, 13],
        [29, 192, 16, 21, 76, 41],
        [17, 11, 154, 7, 21, 15],
        [31, 6, 13, 141, 42, 13],
        [51, 27, 8, 17, 158, 67],
        [19, 12, 63, 19, 31, 172]
    ]
    B = [-706, 1148, -1779, 701, 1339, 1238]
    # note, increase iterations
    it,S = gaussSeidel(A,B=B,N=100)
    # expected
    V = [-8,3,-13,5,6,11]
    if not is_equal(S,V):
        print('Error on test for < gaussSeidel >, test-3')




