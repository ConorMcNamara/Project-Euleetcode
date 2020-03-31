class Solution(object):
    def reverse(self, x):
        """
        :type x: int
        :rtype: int
        """
        if x < 0:
            x_str = str(abs(x))
            x_rev = x_str[::-1]
            if -int(x_rev) < -2 ** 31:
                return 0
            return -int(x_rev)
        else:
            x_str = str(x)
            x_rev = x_str[::-1]
            if int(x_rev) > 2 ** 31 - 1:
                return 0
            return int(x_rev)