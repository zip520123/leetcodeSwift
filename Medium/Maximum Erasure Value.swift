//Maximum Erasure Value
//O(n), O(n), n = nums.len
    func maximumUniqueSubarray(_ nums: [Int]) -> Int {
        var seen = [Int: Int]()
        var l = 0, r = 0, sum = 0, res = 0
        while r < nums.endIndex {
            if let index = seen[nums[r]] {
                while l <= index {
                    seen[nums[l]] = nil
                    sum -= nums[l]
                    l += 1
                }
            }
            seen[nums[r]] = r
            sum += nums[r]
            res = max(res, sum)
            r += 1
        }
        return res
    }

    func maximumUniqueSubarray(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        var l = 0, r = 0, res = 0, sum = 0
        while r < nums.endIndex {
            while set.contains(nums[r]) {
                sum -= nums[l]
                set.remove(nums[l])
                l += 1
            }
            sum += nums[r]
            res = max(res, sum)
            set.insert(nums[r])
            r += 1
        }
        return res
    }

//O(n), O(n)
    func maximumUniqueSubarray(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        var l = 0, r = 0
        var res = 0, curr = 0
        while r<nums.endIndex {
            dict[nums[r], default:0] += 1
            curr += nums[r]
            while dict[nums[r]]! > 1 {
                dict[nums[l]]! -= 1
                curr -= nums[l]
                l += 1
            }
            res = max(res, curr)
            r += 1
        }
        return res
    }