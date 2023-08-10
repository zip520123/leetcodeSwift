/*Search in Rotated Sorted Array II*/
func search(_ nums: [Int], _ target: Int) -> Bool {
    var l = 0, r = nums.endIndex - 1
    while l <= r {
        while l < r && nums[l] == nums[l+1] {l+=1}
        while l < r && nums[r] == nums[r-1] {r-=1}

// the code below is exactly the same with Problem 33.
        let mid = (l+r)>>1
        if nums[mid] == target {return true}
        if nums[mid] >= nums[l] {
            
            if nums[mid] > target && target >= nums[l] {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }else {
            if nums[mid] < target && target <= nums[r] {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
    }
    
    return false
}
// O(n)~o(log n), O(1)
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var l = 0, r = nums.endIndex-1
        while l<=r {
            while l<r && nums[l] == nums[l+1] {l+=1} 
            while l<r && nums[r] == nums[r-1] {r-=1} 
            let mid = l+((r-l)>>1)
            if nums[mid] == target {return true}
            if nums[mid] >= nums[l] {
                if target < nums[l] || target > nums[mid] {
                    l = mid+1
                } else {
                    r = mid-1
                }
            } else {
                if target > nums[r] || target < nums[mid] {
                    r = mid-1
                } else {
                    l = mid+1
                }
            }
        }

        return false
    }