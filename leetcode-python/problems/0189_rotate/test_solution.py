import pytest
from solution import solution

@pytest.mark.parametrize("input, expected", [
    ([2,7,11,15], [0,1]),  # 修改测试用例
])
def test_solution(input, expected):
    assert solution(input) == expected
