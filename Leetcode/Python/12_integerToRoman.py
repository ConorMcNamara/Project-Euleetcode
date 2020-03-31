def intToRoman(num: int) -> str:
    roman_dict = {1: 'I',
                  5: 'V',
                  10: 'X',
                  50: 'L',
                  100: 'C',
                  500: 'D',
                  1000: 'M'}

    def _replace_1(s):
        s = s.replace('I' * 9, 'IX')
        s = s.replace('I' * 5, 'V')
        s = s.replace('I' * 4, 'IV')
        return s

    def _replace_10(s):
        s = s.replace('X' * 9, 'XC')
        s = s.replace('X' * 5, 'L')
        s = s.replace('X' * 4, 'XL')
        return s

    def _replace_100(s):
        s = s.replace('C' * 9, 'CM')
        s = s.replace('C' * 5, 'D')
        s = s.replace('C' * 4, 'CD')
        return s

    if num < 10:
        val = roman_dict[1] * (num % 10)
    elif num < 100:
        multiple_10 = num // 10
        val = roman_dict[10] * multiple_10 + roman_dict[1] * (num % 10)
    elif num < 1000:
        multiple_100 = num // 100
        val = roman_dict[100] * multiple_100 + roman_dict[10] * ((num - 100 * multiple_100) // 10) + roman_dict[1] * ((num - 100 * multiple_100) % 10)
    else:
        multiple_1000 = num // 1000
        val = roman_dict[1000] * multiple_1000 + roman_dict[100] * ((num - 1000 * multiple_1000) // 100) + roman_dict[10] * \
        ((num % 100) // 10) + roman_dict[1] * (num % 100 % 10)
    val = _replace_100(val)
    val = _replace_10(val)
    val = _replace_1(val)
    return val