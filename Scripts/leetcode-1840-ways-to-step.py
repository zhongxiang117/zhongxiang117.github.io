# 1840
# https://leetcode-cn.com/problems/three-steps-problem-lcci

def waysToStep(self, n):
    """
    :type n: int
    :rtype: int
    """
    if n == 0: return 0
    if n == 1: return 1
    if n == 2: return 2
    if n == 3: return 4

    dp = [0 for i in range(n+1)]

    dp[1] = 1
    dp[2] = 2
    dp[3] = 4
    for i in range(4,n+1):
        dp[i] = (dp[i-1] + dp[i-2] + dp[i-3]) % 1000000007
    
    return dp[n]

