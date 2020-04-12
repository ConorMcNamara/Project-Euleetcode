class Solution:
    def lastStoneWeight(self, stones: List[int]) -> int:
        new_stone = sorted(stones.copy(), reverse=True)
        while len(new_stone) > 1:
            max_val = new_stone[0]
            next_max = new_stone[1]
            new_stone.remove(max_val)
            new_stone.remove(next_max)
            if max_val > next_max:
                new_stone.append(max_val - next_max)
            new_stone = sorted(new_stone)
        if len(new_stone) == 1:
            return new_stone[0]
        else:
            return 0