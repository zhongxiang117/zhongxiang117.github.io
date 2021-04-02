# 72
# https://leetcode-cn.com/problems/edit-distance/


def minDistance(word1, word2):
    """
    :type word1: str
    :type word2: str
    :rtype: int
    """
    if word1 == word2: return 0

    m = len(word1)
    n = len(word2)

    if m == 0: return n
    if n == 0: return m

    dp = [[0 for i in range(n+1)] for j in range(m+1)]
    for i in range(1,m+1):
        dp[i][0] = i
        for j in range(1,n+1):
            dp[0][j] = j
            if word1[i-1] == word2[j-1]:
                dp[i][j] = dp[i-1][j-1]
            else:
                dp[i][j] = min(dp[i-1][j],dp[i][j-1],dp[i-1][j-1]) + 1

    return dp[m][n]

