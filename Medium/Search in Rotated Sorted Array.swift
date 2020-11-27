/*Search in Rotated Sorted Array*/
func search(_ nums: [Int], _ target: Int) -> Int {
    let ncount = nums.count
    var left = 0, right = ncount - 1
    var start = 0
    while(left < right) {
        let mid = left + (right - left) / 2
        if mid - 1 >= 0 && nums[mid] < nums[mid - 1] {
            start = mid 
        }
        if mid + 1 < ncount && nums[mid] > nums[mid + 1] {
            start = mid + 1
        }
        if nums[mid] > nums[left] {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    if nums[start] == target {
        return start
    } 
    left = 0
    right = ncount - 1
    
    if start != 0 && target >= nums[left]{ 
        right = start
    } else {
        left = start
    }
    
    while(left < right) {
        let mid = left + (right - left) / 2
        if nums[mid] < target {
            left = mid + 1
        } else if nums[mid] > target {
            right = mid - 1
        } else {
            return mid
        }
    }
    
    if nums[left] == target {return left}

    return -1
}

// let input = [4,5,6,7,0,1,2]
// let input2 = 2
// let input = [1,3]
// let input2 = 0

let input = [1,3]
let input2 = 3
print(search(input, input2))