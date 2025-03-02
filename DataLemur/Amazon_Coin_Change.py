def coin_change(coins, target_amount):
    def min_coins(index, current_amount):
        if current_amount == target_amount:
            return 0

        if index == len(coins) or current_amount > target_amount:
            return float("inf")

        choose = 1 + min_coins(index, current_amount + coins[index])
        skip = min_coins(index + 1, current_amount)
        return min(choose, skip)

    result = min_coins(0, 0)
    if result == float("inf"):
        return -1
    else:
        return result
