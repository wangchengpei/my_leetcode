#!/bin/bash
# 用法: ./create_problem.sh [语言] [题号] [题目名称]
# 示例:
#   ./create_problem.sh python 0001 "two sum"
#   ./create_problem.sh go 0002 "add two numbers"
#   ./create_problem.sh rust 0003 "longest substring"

LANGUAGE=$1
PROBLEM_ID=$2
PROBLEM_NAME=$3

# 转换为下划线命名（如 two_sum）
DIR_NAME="${PROBLEM_ID}_${PROBLEM_NAME// /_}"

case $LANGUAGE in
  python)
    TARGET_DIR="leetcode-python/problems/${DIR_NAME}"
    mkdir -p "$TARGET_DIR"

    cat > "$TARGET_DIR/solution.py" <<EOF
# LeetCode $PROBLEM_ID: $PROBLEM_NAME
from typing import List, Optional

def solution(input: List[int]) -> List[int]:
    """
    :type input: List[int]
    :rtype: List[int]
    """
    # Your code here
    return []

if __name__ == "__main__":
    print(solution([2,7,11,15], 9))  # 修改输入
EOF

    cat > "$TARGET_DIR/test_solution.py" <<EOF
import pytest
from solution import solution

@pytest.mark.parametrize("input, expected", [
    ([2,7,11,15], [0,1]),  # 修改测试用例
])
def test_solution(input, expected):
    assert solution(input) == expected
EOF
    ;;

  go)
    TARGET_DIR="leetcode-go/problems/${DIR_NAME}"
    mkdir -p "$TARGET_DIR"

    cat > "$TARGET_DIR/solution.go" <<EOF
package ${PROBLEM_NAME// /_}

func ${PROBLEM_NAME// /_}(input interface{}) interface{} {
    // Your code here
    return nil
}
EOF

    cat > "$TARGET_DIR/solution_test.go" <<EOF
package ${PROBLEM_NAME// /_}

import "testing"

func Test${PROBLEM_NAME// /_}(t *testing.T) {
    // Test cases
}
EOF
    ;;

  rust)
    TARGET_DIR="leetcode-rust/src/problems/${DIR_NAME}"
    mkdir -p "$TARGET_DIR"

    cat > "$TARGET_DIR/mod.rs" <<EOF
pub fn ${PROBLEM_NAME// /_}(input: i32) -> i32 {
    // Your code here
    0
}
EOF

    cat > "$TARGET_DIR/tests.rs" <<EOF
use super::*;

#[test]
fn test_${PROBLEM_NAME// /_}() {
    // Test cases
}
EOF

    # 自动追加模块声明到 leetcode-rust/src/problems/mod.rs
    if [ ! -f "leetcode-rust/src/problems/mod.rs" ]; then
        touch "leetcode-rust/src/problems/mod.rs"
    fi
    echo "pub mod ${DIR_NAME};" >> "leetcode-rust/src/problems/mod.rs"
    ;;

  *)
    echo "错误: 不支持的语言 '$LANGUAGE'"
    echo "用法: $0 [python|go|rust] [题号] [题目名称]"
    exit 1
    ;;
esac

echo "✅ [$LANGUAGE] 题目 $PROBLEM_ID 创建成功: $TARGET_DIR"