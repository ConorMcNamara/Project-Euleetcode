class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        max_profit, current_min_price = 0, float('inf')
        for price in prices:
            current_min_price = min(current_min_price, price)
            profit = price - current_min_price
            max_profit = max(max_profit, profit)
        return max_profit