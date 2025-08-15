# LeetCode 0169: majority element
"""
给定一个大小为 n 的数组 nums ，返回其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素。

你可以假设数组是非空的，并且给定的数组总是存在多数元素。



示例 1：

输入：nums = [3,2,3]
输出：3
示例 2：

输入：nums = [2,2,1,1,1,2,2]
输出：2


提示：
n == nums.length
1 <= n <= 5 * 104
-109 <= nums[i] <= 109
"""

from typing import List, Optional
from math import inf

def solution(input: List[int]) -> int:
    """
    :type input: List[int]
    :rtype: int
    """
    ans, cnts = inf, 0
    for v in input:
        if ans == v:
            cnts += 1
        elif not cnts:
            ans = v
        else:
            cnts -= 1
    return ans




if __name__ == "__main__":
    print(solution([1,2,3,2,4,2,5,2,2]))  # 修改输入
