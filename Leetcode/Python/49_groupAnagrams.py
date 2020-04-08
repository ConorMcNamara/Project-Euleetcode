class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        from itertools import groupby
        temp = lambda x: sorted(x)
        return [list(val) for key, val in groupby(sorted(strs, key=temp), temp)]