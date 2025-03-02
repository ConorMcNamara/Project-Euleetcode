def two_sum(nums: list[int], target: int) -> list[int]:
    for i, val in enumerate(nums):
        for ii, val2 in enumerate(nums[i+1:]):
      # Since nums[i+1:] is a new list, enumerate is going to
      # return the index starting at 0. Meaning that we need
      # to return the index it would've been at the original point
      # which is i + ii + 1
            if val + val2 == target:
                return [i, i+ii+1]
    else:
        return [-1, -1]