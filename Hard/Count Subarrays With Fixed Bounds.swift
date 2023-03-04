//Count Subarrays With Fixed Bounds
//O(n), O(1)
    func countSubarrays(_ nums: [Int], _ minK: Int, _ maxK: Int) -> Int {
        var leftBound = -1, lastMin = -1, lastMax = -1, count = 0
        for i in 0..<nums.endIndex {
            if nums[i] >= minK && nums[i] <= maxK {
                if nums[i] == minK {lastMin = i}
                if nums[i] == maxK {lastMax = i}
                count += max(0, min(lastMin, lastMax) - leftBound)
            } else {
                leftBound = i
                lastMin = -1
                lastMax = -1
            }
        }
        return count
    }