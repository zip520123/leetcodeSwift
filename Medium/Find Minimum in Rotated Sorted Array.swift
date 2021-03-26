/*Find Minimum in Rotated Sorted Array*/
//time O(log n)
func findMin(_ nums: [Int]) -> Int {
    let ncount = nums.count
    if ncount == 1 {return nums[0]}
    if nums[0] < nums[ncount - 1] {return nums[0]}
    var left = 0
    var right = ncount - 1
    while left < right {
        let mid = left + (right - left) / 2
        if mid-1 >= 0 && nums[mid] < nums[mid - 1] {
            return nums[mid]
        }
        if mid+1 < ncount && nums[mid] > nums[mid + 1] {
            return nums[mid + 1]
        }
        if nums[mid] > nums[left] {
            left = mid + 1
        } else {
            right = mid
        }
    }
    return -1
}
//time O(log n)
func findMin(_ nums: [Int]) -> Int {
    let ncount = nums.count
    
    var left = 0
    var right = ncount - 1
    while left < right {
        let mid = left + (right - left) / 2
        if nums[mid] < nums[right] {
            // Case 1) Right side sorted, left side has pivot (minval), go left to find it
            // Case 2) Both sides sorted, go left to find the smallest value (minval)
            right = mid
        } else {
            // Case 1) Left side sorted, right side has pivot (minval), go right to find it
            left = mid + 1
        }
    }
    return nums[left]
}

//time O(log n)
func findMin(_ nums: [Int]) -> Int {
    
    func dfs(_ l:Int, _ r: Int) -> Int {
        if l+1 >= r {return min(nums[l],nums[r])} // elements < 2    
        if nums[l] < nums[r] { //sorted 
            return nums[l]
        }
        let mid = l + (r-l) >> 1
        return min(dfs(l,mid),dfs(mid+1,r))
    }
    
    return dfs(0,nums.endIndex - 1)
}