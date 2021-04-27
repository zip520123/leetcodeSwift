//Missing Element in Sorted Array
//O(n) O(1)
    func missingElement(_ nums: [Int], _ k: Int) -> Int {
        var n = nums[0]
        var index = 0, curr = 0
        while curr < k {
            if index < nums.endIndex && n == nums[index] {
                index += 1
                n += 1
            } else {
                curr += 1
                if curr == k {
                    return n
                }
                n += 1
            }
        }   
        return -1
    }
//O(log n) O(1)
    func missingElement(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.endIndex
        func missingNum(_ i: Int) -> Int {
           return nums[i] - (nums[0] + i)
        }
        if missingNum(n-1) < k {
            return nums[n-1] + (k - missingNum(n-1))
        }
        var l = 0, r = nums.endIndex - 1
        while l < r {
            let mid = (l+r)>>1
            if missingNum(mid) < k {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return nums[l-1] + (k - missingNum(l-1))
    }