//: [Previous](@previous)

//: See [https://leetcode-cn.com/problems/add-two-numbers/solution/](https://leetcode-cn.com/problems/add-two-numbers/solution/)

/*:
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example:

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.
 */

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    func debugPrint() -> Self {
        var arr = [Int]()
        arr.append(val)
        var l1: ListNode? = next
        while l1 != nil {
            arr.append(l1!.val)
            l1 = l1?.next
        }
        print(arr)
        return self
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var carry = 0, p = l1, q = l2
        let dummy = ListNode(0)
        var node = dummy
        while p != nil || q != nil {
            carry += p?.val ?? 0
            carry += q?.val ?? 0
            node.next = ListNode.init(carry % 10)
            node = node.next!
            carry = carry / 10
            p = p?.next
            q = q?.next
        }
        if carry > 0 {
            node.next = ListNode.init(carry)
        }
        return dummy.next
    }
    
    func createListNode(for vals: [Int]) -> ListNode? {
        let l1: ListNode? = ListNode.init(0)
        var node = l1
        for num in vals {
            node?.next = ListNode.init(num)
            node = node?.next
        }
        return l1?.next
    }
}

let val1 = [1,2,0]
let val2 = [3,4,0]
let solution = Solution()
let l1 = solution.createListNode(for: val1)
let l2 = solution.createListNode(for: val2)

let list = solution.addTwoNumbers(l1, l2)
list?.debugPrint()


//: [Next](@next)
