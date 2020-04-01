class Solution:
    def combine(self, n: int, k: int) -> List[List[int]]:
        values = [*range(1, n+1)]
        from itertools import combinations
        return list(combinations(values, k))