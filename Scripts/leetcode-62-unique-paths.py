# 62
# https://leetcode-cn.com/problems/unique-paths/

def unique_paths(m,n):
    if m <= 0 or n <= 0:
        return 0

    dp = [[0 for i in range(n)] for j in range(m)]

    for i in range(m):
        dp[i][0] = 1
        for j in range(n):
            dp[0][j] = 1
            if i >= 1 and j >= 1:
                dp[i][j] = dp[i-1][j] + dp[i][j-1]
    return dp[m-1][n-1]


def optimal_unique_paths(m,n):
    if m <= 0 or n <= 0:
        return 0
    
    dp = [1 for i in range(n)]
    for j in range(1,m):
        for i in range(1,n):
            dp[i] = dp[i] + dp[i-1]
    return dp[n-1]
