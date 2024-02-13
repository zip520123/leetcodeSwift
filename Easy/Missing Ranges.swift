//Missing Ranges
//O(n) TLE
class Solution {
    func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [String] {
        var set = Set(nums)
        var res = [String]()
        var i = lower
        while i <= upper {
            if set.contains(i) == false {
                var p = i
                var curr = i
                while set.contains(curr+1) == false && curr < upper {
                    curr += 1
                }
                if p == curr {
                    res.append("\(p)")
                } else {
                    res.append("\(p)->\(curr)")
                }
                i = curr
            }
            i += 1
        }
        return res
    }
}

    func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [String] {
        var res = [String]()
        var start = lower
        var i = 0
        while i < nums.endIndex {
            let end = nums[i] - 1
            if start <= end {
                if start == end {
                    res.append("\(start)")
                } else {
                    res.append("\(start)->\(end)")
                }
            }
            start = nums[i]+1
            i += 1
        }

        let end = upper
        if start <= end {
            if start == end {
                res.append("\(start)")
            } else {
                res.append("\(start)->\(end)")
            }
        }
        
        return res
    }

    func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [[Int]] {
        var res = [[Int]]()
        if nums.endIndex == 0 { return [[lower, upper]] }
        for i in 0..<nums.endIndex-1 {
            let l = nums[i]+1, r = nums[i+1]-1
            if l<=r {
                res.append([l,r])
            }
        }
        if lower < nums[0] {
            res.insert([lower, nums[0]-1], at: 0)
        }
        if nums.last! < upper {
            res.append([nums.last!+1, upper])
        }
        return res
    }