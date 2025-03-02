def triangular_sum(nums):
    num_len = len(nums)
    if num_len == 1:
        return nums[0] % 10
    else:
        n_iterations = num_len - 1
        new_nums = [0] * n_iterations
        for i in range(n_iterations):
            new_nums[i] = (nums[i] + nums[i + 1]) % 10
        nums = new_nums
        return triangular_sum(nums)
