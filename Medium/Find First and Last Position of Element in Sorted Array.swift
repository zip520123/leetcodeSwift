/*Find First and Last Position of Element in Sorted Array*/
//O(n log n) O(1)
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.endIndex == 0 {return [-1,-1]}
        var l = 0, r = nums.endIndex - 1
        while l < r {
            let mid = (l+r) >> 1
            if nums[mid] < target {
                l = mid + 1
            } else {
                r = mid
            }
        }
        if nums[l] != target {return [-1,-1]}
        var res = [l]
        
        r = nums.endIndex
        while l < r {
            let mid = (l+r) >> 1
            if nums[mid] <= target {
                l = mid + 1
            } else {
                r = mid
            }
        }
        res.append(l - 1)
        return res

    }