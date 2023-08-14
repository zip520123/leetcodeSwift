//Kth Largest Element in an Array
//O(n log n) O(n)
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        return nums.sorted(by: >)[k-1]
    }

//O(n^2), O(n)
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        func quickSelect(_ start: Int, _ end: Int) -> Int {
            if start > end {return Int.max}

            var left = start
            let p = nums[end]
            for i in start..<end {
                if nums[i] >= p {
                    (nums[left], nums[i]) = (nums[i], nums[left])
                    left += 1
                }
            }
            (nums[left], nums[end]) = (nums[end], nums[left])
            if left + 1 == k {
                return nums[left]
            } else if left + 1 > k{
                return quickSelect(start, left - 1)
            } else {
                return quickSelect(left+1, end)
            }
        }
        
        return quickSelect(0,nums.endIndex - 1)
    }


class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        return quickSelect(0,nums.endIndex - 1, &nums, k)
    }
    
    func quickSelect(_ start: Int, _ end: Int, _ nums: inout [Int], _ k: Int) -> Int {
        if start > end {return Int.max}
        if start == end {return nums[start]}
        var left = start
        let p = nums[end]
        for i in start..<end {
            if nums[i] >= p {
                (nums[left], nums[i]) = (nums[i], nums[left])
                left += 1
            }
        }
        (nums[left], nums[end]) = (nums[end], nums[left])
        if left + 1 == k {
            return nums[left]
        } else if left + 1 > k{
            return quickSelect(start, left - 1, &nums, k)
        } else {
            return quickSelect(left+1, end, &nums, k)
        }
    }
}

//O(n^2), O(n)
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        
        func dfs(_ left: Int, _ right: Int) -> Int {
            var l = left, r = right
            var i = l
            while i < r {
                if nums[r] <= nums[i] {
                    (nums[i], nums[l]) = (nums[l], nums[i])
                    l += 1
                    i += 1
                } else {
                    i+=1
                }    
            }
            (nums[l], nums[i]) = (nums[i], nums[l])
            if l+1 == k {
                return nums[l]
            } else if l+1 > k {
                return dfs(0, l-1)
            } else {
                return dfs(l+1, r)
            }
        }
        
        return dfs(0, nums.endIndex-1)
    }

// O(n^2), O(n)
func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    let n = nums.endIndex
    var nums = nums

    func dfs(_ left: Int, _ right: Int) -> Int {
        var p = right, l = left, r = left
        while r<p {
            if nums[r] >= nums[p] {
                (nums[l], nums[r]) = (nums[r], nums[l])
                l += 1
            }
            r += 1
        }
        (nums[l], nums[p]) = (nums[p], nums[l])
        if l == k-1 {
            return nums[l]
        } else if l > k-1 {
            return dfs(0,l-1)
        } else {
            return dfs(l+1,r)
        }
    }

    return dfs(0,n-1)
}