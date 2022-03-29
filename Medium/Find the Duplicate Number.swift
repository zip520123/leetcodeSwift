//Find the Duplicate Number
//O(n) O(n)
func findDuplicate(_ nums: [Int]) -> Int {
    var set = Set<Int>()
    for n in nums {
        if set.contains(n) {
            return n
        }
        set.insert(n)
    }
    return 0
}

//O(n), O(1)
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = nums[0], fast = nums[0]
        while true {
            slow = nums[slow]
            fast = nums[nums[fast]]
            if slow == fast {
                break
            }
        }
        slow = nums[0]
        while slow != fast {
            slow = nums[slow]
            fast = nums[fast]
        }
        return fast
    }