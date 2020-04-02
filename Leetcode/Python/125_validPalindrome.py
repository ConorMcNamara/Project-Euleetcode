class Solution:
    def isPalindrome(self, s: str) -> bool:
        import re
        s = re.sub('[^0-9a-zA-Z]+', '', s).casefold()
        return s == s[::-1]