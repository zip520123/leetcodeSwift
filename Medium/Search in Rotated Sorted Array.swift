/*Search in Rotated Sorted Array*/
//O(log n)
func search(_ nums: [Int], _ target: Int) -> Int {
    var left = 0, right = nums.endIndex - 1
    while left <= right {
        let mid = (left + right ) >> 1
        if target == nums[mid] {
            return mid
        }
        //left sorted postion 
        if nums[left] <= nums[mid] {
            if target > nums[mid] || target < nums[left] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        } else {
            //right postion
            if target < nums[mid] || target > nums[right] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }

    }
    return -1
}

func search(_ nums: [Int], _ target: Int) -> Int {
    func dfs(_ l: Int, _ r: Int) -> Int {
        if l == r {
            if nums[l] == target {
                return l
            } else {
                return -1    
            }
        }
        
        let mid = (l+r)>>1
        if nums[l] < nums[r] {
            //sorted
            if nums[mid] < target {
                return dfs(mid+1,r)
            } else {
                return dfs(l,mid)
            }
        } else {
            if nums[mid] >= nums[l] {
                //left sorted
                if target >= nums[l] && target <= nums[mid] {
                    return dfs(l,mid)
                } else {
                    return dfs(mid+1,r)
                }
            } else {
                //right sorted
                if target > nums[mid] && target < nums[l] {
                    return dfs(mid+1,r)
                } else {
                    return dfs(l,mid)
                }
            }
        }
        
    }
    
    return dfs(0,nums.endIndex - 1)
}

// let input = [4,5,6,7,0,1,2]
// let input2 = 2
// let input = [1,3]
// let input2 = 0

let input = [1,3]
let input2 = 3
print(search(input, input2))