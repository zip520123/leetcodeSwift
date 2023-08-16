/*Sliding Window Maximum*/
//O(n*k) O(k)
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var res = [Int]()
        var window = [Int]()
        for i in 0..<nums.endIndex {
            let n = nums[i]
            window.append(n)
            
            if i >= k - 1 {
                res.append(window.reduce(Int.min,{max($0,$1)}))
                window.remove(at:0)
            }
        }
        return res 
    }
//O(n) O(k)
class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var res = [Int]()
        var window = [Int]()
        for i in 0..<nums.endIndex {
            let n = nums[i]
            while !window.isEmpty && nums[window.last!] < n {
                window.removeLast()
            }
            window.append(i)
            
            if i >= k - 1 {
                res.append(nums[window.first!])
                if window.first! == i - k + 1 {
                    window.removeFirst()
                }
            }
        }
        return res 
    }

}

// O(n), O(n)
func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    var queue = [Int](), res = [Int]()
    for (i,n) in nums.enumerated() {
        while !queue.isEmpty && nums[queue.last!] < n {
            queue.removeLast()
        }
        queue.append(i)
        if i >= k-1 {
            res.append(nums[queue[0]])
        }
        if queue[0] == i-k+1 {
            queue.removeFirst()
        }
    }
    return res
}