class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        if len(s) == 0:
            return 0
        else:
            max_val = 1
            for index, substring in enumerate(s):
                seen_before = [substring]
                current_val = 1
                for sub_substring in range(index+1, len(s)):
                    if s[sub_substring] in seen_before:
                        if current_val > max_val:
                            max_val = current_val
                        break
                    else:
                        seen_before.append(s[sub_substring])
                        current_val += 1
                        if current_val > max_val:
                            max_val = current_val
            return max_val