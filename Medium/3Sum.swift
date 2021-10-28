/*3Sum*/
//time O(n^2) space O(n)
func threeSum(_ nums: [Int]) -> [[Int]] {
    let nums = nums.sorted()
    let ncount = nums.count
    var res = [[Int]]()
    var i = 0
    var prev = Int.max
    while(i<ncount - 2) {
        var left = i + 1, right = ncount - 1
        let a = nums[i]
        if prev == a {
            i += 1
            continue
        }
        while(left < right) {
            let b = nums[left], c = nums[right]
            let sum = a + b + c
            if sum == 0 {
                res.append([a,b,c])
                while(left + 1 < right && nums[left + 1] == nums[left]) {
                    left += 1
                }
                while(right - 1 > left && nums[right - 1] == nums[right]) {
                    right -= 1
                }
                left += 1
                right -= 1
            } else if sum > 0 {
                right -= 1
            } else {
                left += 1
            }
        }
        prev = a
        i += 1
    }
    return res
}

//O(n^2), O(n)
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        let nums = nums.sorted(by: <)
        var i = 0
        while i < nums.endIndex-2 {
            if i > 0 && nums[i-1] == nums[i] {
                i += 1
                continue
            }
            var l = i+1, r = nums.endIndex-1
            while l<r {
                let sum = nums[i] + nums[l] + nums[r]
                if sum == 0 {
                    res.append([nums[i],nums[l],nums[r]])
                    while l+1 < nums.endIndex && nums[l] == nums[l+1] {
                        l += 1    
                    }
                    while r-1 >= 0 && nums[r] == nums[r-1] {
                        r -= 1    
                    }
                    l += 1
                    r -= 1
                } else if sum < 0 {
                    while l+1 < nums.endIndex && nums[l] == nums[l+1] {
                        l += 1    
                    }
                    l += 1
                } else {
                    while r-1 >= 0 && nums[r] == nums[r-1] {
                        r -= 1    
                    }
                    r -= 1
                }
            }
            i += 1
        }
        return res
    }