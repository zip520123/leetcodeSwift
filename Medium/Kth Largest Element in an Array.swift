//Kth Largest Element in an Array
//O(n log n) O(n)
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        return nums.sorted(by: >)[k-1]
    }

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

    let input = [3,2,1,5,6,4]
    let input2 = 2

    print(findKthLargest(input, input2))