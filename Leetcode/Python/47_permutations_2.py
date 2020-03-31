class Solution:
    def permuteUnique(self, nums: List[int]) -> List[List[int]]:
        import itertools
        perms = list(itertools.permutations(nums, len(nums)))
        res = []
        [res.append(x) for x in perms if x not in res]
        return res