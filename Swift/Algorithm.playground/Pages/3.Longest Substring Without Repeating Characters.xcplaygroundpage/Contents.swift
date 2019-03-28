

import Foundation

class Solution {
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var map = [Character: Int](), i = 0, j = 0, longest = 0
        let sChars = Array(s)
        while j < sChars.count {
            let c = sChars[j]
            if let index = map[c] {
                i = max(i, index)
            }
            // 1.
            longest = max(longest, j - i + 1)
            j += 1
            // 在j+=1之后在存到map中, 以及在1.处计算的 + 1, 是为了兼容 string长度为1的字符串
            map[c] = j
        }
        return longest
    }
    
}

print(Solution().lengthOfLongestSubstring("pwwkewabc"))

//: [Next](@next)
