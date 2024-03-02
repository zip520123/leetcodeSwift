//Squares of a Sorted Array
//O(n log n) O(n)
func sortedSquares(_ nums: [Int]) -> [Int] {
    return nums.map {$0 * $0}.sorted()
}

//O(n) O(1)
    func sortedSquares(_  nums: [Int]) -> [Int] {
        var l = 0 , r = nums.endIndex - 1
        
        var res = [Int]()
        while l <= r {
            let left = nums[l] * nums[l]
            let right = nums[r] * nums[r]
            if left > right {
                res.insert(left, at:0)
                l += 1
            } else {
                res.insert(right, at: 0)
                r -= 1
            }
        }
        
        return res
    }

// O(n), O(n)
func sortedSquares(_ nums: [Int]) -> [Int] {
    var res = [Int]()
    let arr = nums.map { $0 * $0 }
    var l = 0, r = arr.endIndex-1
    while l<=r {
        if arr[l] < arr[r] {
            res.append(arr[r])
            r -= 1
        } else {
            res.append(arr[l])
            l += 1
        }
    }
    return res.reversed()
}