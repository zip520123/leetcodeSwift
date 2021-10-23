//Find Minimum in Rotated Sorted Array II
//O(log n), O(1)
    func findMin(_ nums: [Int]) -> Int {
        var l = 0, r = nums.endIndex-1
        while l<r {
            let mid = l+(r-l)>>1
            if nums[mid] > nums[r] {
                l = mid+1
            } else if nums[mid] < nums[r] {
                r = mid
            } else {
                r -= 1
            }
        }
        return nums[l]
    }

//find minimun index
    func findMin(_ nums: [Int]) -> Int {
        var l = 0, r = nums.endIndex-1
        while l<r {
            let mid = l+(r-l)>>1
            if nums[mid] > nums[r] {
                l = mid+1
            } else if nums[mid] < nums[r] {
                r = mid
            } else {
                if (nums[r - 1] > nums[r]) {
                    l = r
                    break
                }
                r -= 1
            }
        }
        return nums[l]
    }