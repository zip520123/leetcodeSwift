// Shortest Unsorted Continuous Subarray
//O(n log n), O(n)
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        let arr = nums.sorted()
        var start = nums.endIndex, end = 0
        for i in 0..<arr.endIndex {
            if arr[i] != nums[i] {
                start = min(start, i)
                end = max(end, i)
            }
        }
        return end-start >= 0 ? end-start+1 : 0
    }

//O(n), O(n)
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        var l = nums.endIndex, r = 0
        var stack = [Int]()
        for i in 0..<nums.endIndex {
            while !stack.isEmpty && nums[stack.last!] > nums[i] {
                l = min(l, stack.last!)
                stack.removeLast()
            }
            stack.append(i)
        }
        stack.removeAll()
        for i in (0..<nums.endIndex).reversed() {
            while !stack.isEmpty && nums[stack.last!] < nums[i] {
                r = max(r, stack.last!)
                stack.removeLast()
            }
            stack.append(i)
        }
        return r-l > 0 ? r-l+1 : 0
    }