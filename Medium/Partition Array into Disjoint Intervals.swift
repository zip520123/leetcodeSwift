//Partition Array into Disjoint Intervals
//O(n),O(2n)
    func partitionDisjoint(_ nums: [Int]) -> Int {
        var leftMax = (0..<nums.endIndex).map{_ in 0}
        leftMax[0] = nums[0]
        for i in 1..<nums.endIndex {
            leftMax[i] = max(nums[i], leftMax[i-1])
        }
        var rightMin = (0..<nums.endIndex).map{_ in 0}
        rightMin[nums.endIndex-1] = nums.last!
        for i in (0..<nums.endIndex-1).reversed() {
            rightMin[i] = min(nums[i],rightMin[i+1])
        }
        for i in 0..<nums.endIndex-1 {
            if leftMax[i] <= rightMin[i+1] {return i+1}
        }
        return -1
    }