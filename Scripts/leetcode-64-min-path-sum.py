# 64
# https://leetcode-cn.com/problems/minimum-path-sum/

def min_path_sum(grid):
    m = len(grid)
    if m <= 0: return 0
    
    n = len(grid[0])
    if n <= 0: return 0
    
    dp = [[0 for i in range(n)] for j in range(m)]

    for i in range(m):
        s = 0
        for t in range(i): s += grid[t][0]
        dp[i][0] = s + grid[i][0]
        for j in range(n):
            s = 0
            for t in range(j): s += grid[0][t]
            dp[0][j] = s + grid[0][j]
            if i >= 1 and j >= 1:
                dp[i][j] = min(dp[i-1][j],dp[i][j-1]) + grid[i][j]
    return dp[m-1][n-1]


