def isPalindrome(phrase):
    fixed_phrase = "".join(ch for ch in phrase if ch.isalnum()).casefold()
    return fixed_phrase == fixed_phrase[::-1]
