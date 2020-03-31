class Solution(object):
    def findMedianSortedArrays(self, nums1, nums2):
        """
        :type nums1: List[int]
        :type nums2: List[int]
        :rtype: float
        """
        combined_array = sorted(nums1 + nums2)
        combined_length = len(combined_array)
        if combined_length == 1:
            return combined_array[0]
        if combined_length % 2 == 0:
            return (combined_array[combined_length / 2 - 1] + combined_array[combined_length / 2]) / 2.0
        else:
            return combined_array[int(combined_length / 2)]