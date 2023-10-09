/*Find First and Last Position of Element in Sorted Array*/
//O(log n) O(1)
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

// O(log n), O(1)
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var l = 0, r = nums.endIndex
        if nums.endIndex == 0 {return [-1,-1]}
        while l<r {
            let mid = l+((r-l)>>1)
            let t = Double(target) - 0.5
            if Double(nums[mid]) < t {
                l = mid + 1
            } else {
                r = mid
            }
        }
        var res = [l]
        if l < 0 || l == nums.endIndex || nums[l] != target {return [-1,-1]}
        l = 0; r = nums.endIndex
        while l<r {
            let mid = l+((r-l)>>1)
            let t = Double(target) + 0.5
            if Double(nums[mid]) < t {
                l = mid + 1
            } else {
                r = mid
            }
        }
        res.append(l-1)
        
        return res
    }