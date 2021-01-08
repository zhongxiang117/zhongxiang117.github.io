#!/bin/python3

"""
        dp[i][j-1]
max = {
        p[j] - p[n] + dp[i-1][n]    n=0,1,...j-1
"""


# Time consuming method

def best_time_to_buy_and_sell_stock_BAD(prices):
    if len(prices) == 0:
        return 0

    dp = [[0 for i in range(len(prices))] for i in range(2+1)]
    
    for i in range(1,2+1):
        for j in range(1,len(prices)):
            
            maxprofit = 0
            for n in range(j):
                maxprofit = max(maxprofit, prices[j] - prices[n] + dp[i-1][n])

            dp[i][j] = max(maxprofit, dp[i][j-1])

    return dp[2][-1]


def best_time_to_buy_and_sell_stock(prices):
    if len(prices) == 0:
        return 0

    dp = [[0 for i in range(len(prices))] for i in range(2+1)]
    
    for i in range(1,2+1):
        # think about in here!
        # Amazing!!
        maxprofit = -prices[0]
        for j in range(1,len(prices)):
            dp[i][j] = max(dp[i][j-1], maxprofit + prices[j])
            maxprofit = max(maxprofit, dp[i-1][j] - prices[j])

    return dp[2][-1]

