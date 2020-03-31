class Solution(object):
    def longestPalindrome(self, s):
        """
        :type s: str
        :rtype: str
        """
        if s == s[::-1]:
            return s
        else:
            palindrome = ''
            for i in range(len(s)):
                if s[i:] == s[i:][::-1] and len(s[i:]) > len(palindrome):
                    palindrome = s[i:]
                for j in range(1, len(s) - i):
                    s_copy = s[i:-j]
                    if s_copy == s_copy[::-1] and len(s_copy) > len(palindrome):
                        palindrome = s_copy
            return palindrome
