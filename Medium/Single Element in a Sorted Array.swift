//Single Element in a Sorted Array
//O(n), O(1)
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        nums.reduce(0, ^)
    }

//O(log n), O(1)
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var l = 0, r = nums.endIndex - 1
        while l<r {
            let mid = l+(r-l)>>1
            if mid%2==0 && nums[mid] == nums[mid+1] || mid%2==1 && nums[mid] == nums[mid-1] {
                l = mid+1
            } else {
                r = mid
            }
        }
        return nums[l]
    }