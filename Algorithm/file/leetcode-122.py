def maxProfit(prices):
    if len(prices) == 0:
        return 0

    valley = prices[0]
    peak = prices[0]
    mp = 0
    
    i = 0
    while i < len(prices):
        
        # find continue down
        while i < len(prices)-1:
            if prices[i] >= prices[i+1]:
                i += 1
            else:
                break              
            
        valley = prices[i]
        
        # find continue up
        while i < len(prices)-1:
            if prices[i] < prices[i+1]:
                i += 1
            else:
                break
                
        peak = prices[i]
        
        mp += peak - valley
        
        # important, evolve!
        i += 1
        
    return mp