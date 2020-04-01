class Solution(object):
    def lengthOfLastWord(self, s):
        """
        :type s: str
        :rtype: int
        """
        x = s.split()
        if not x:
            return 0
        return len(x[len(x) - 1])