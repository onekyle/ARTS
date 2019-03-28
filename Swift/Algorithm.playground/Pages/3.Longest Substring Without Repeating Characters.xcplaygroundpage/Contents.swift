

import Foundation

class Solution {
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        // 使用 2个 character的数组, 一个为之前最长的数组 一个为当前数组
        
        // 遍历输入字符串的所有 字符
        // > 检查当前的字符, 若当前数组包含此字符, 就从重复的位置截断当前数组, 在拼接此字符,未重复就添加到当前数组,
        // > 判断当前数组与之前最长数组, 赋值
        // >        
        var arrLongest = [Character](), currentArr = arrLongest
        for (i,c) in s.enumerated() {
            if let index = currentArr.firstIndex(of: c) {
                if index == currentArr.count - 1 {
                    currentArr = [c]
                } else {
                    currentArr.removeSubrange(0...index)
                    currentArr.append(c)
                }
            } else {
                currentArr.append(c)
            }
            if currentArr.count > arrLongest.count {
                arrLongest = currentArr
            }
            if arrLongest.count - currentArr.count == s.count - i - 1 {
                break
            }
        }
//        print(arrLongest)
        return arrLongest.count
    }
    
}

print(Solution().lengthOfLongestSubstring("pwwkewfsa;lkdjfalkfdjaljfdlaksfkahfajkdhsflajksdhfasdfadsf,pwwkewfsa;lkdjfalkfdjaljfdlaksfkahfajkdhsflajksdhfasdfadsf,pwwkewfsa;lkdjfalkfdjaljfdlaksfkahfajkdhsflajksdhfasdfadsf,pwwkewfsa;lkdjfalkfdjaljfdlaksfkahfajkdhsflajksdhfasdfadsf,pwwkewfsa;lkdjfalkfdjaljfdlaksfkahfajkdhsflajksdhfasdfadsf,pwwkewfsa;lkdjfalkfdjaljfdlaksfkahfajkdhsflajksdhfasdfadsf,pwwkewfsa;lkdjfalkfdjaljfdlaksfkahfajkdhsflajksdhfasdfadsf"))

//: [Next](@next)
