//Split Array with Equal Sum
//O(n^4)
class Solution {
    func splitArray(_ nums: [Int]) -> Bool {
        if nums.endIndex < 7 {return false}
        var sum1 = 0
        for i in 0...nums.endIndex-7 {
            sum1 += nums[i]
            var sum2 = 0
            for j in i+2...nums.endIndex-5 {
                sum2 += nums[j]
                var sum3 = 0
                for k in j+2...nums.endIndex-3 {
                    sum3 += nums[k]
                    var sum4 = 0
                    for l in k+2..<nums.endIndex {
                        sum4 += nums[l]
                    }
                    if sum1 == sum2 && sum1 == sum3 && sum1 == sum4 {
                        return true
                    }
                }
            }
        }
        return false
    }
}

//O(n^2)
class Solution {
    func splitArray(_ nums: [Int]) -> Bool {
        if nums.endIndex < 7 {return false}
        var sum = (0..<nums.endIndex).map {_ in 0}
        sum[0] = nums[0]
        for i in 1..<nums.endIndex {
            sum[i] = nums[i] + sum[i-1]
        }
        for j in 3..<nums.endIndex - 3 {
            var set = Set<Int>()
            for i in 1..<j-1 {
                if sum[i-1] == sum[j-1] - sum[i] {
                    set.insert(sum[i-1])
                }
            }
            for k in j+2..<nums.endIndex-1 {
                if sum[nums.endIndex - 1] - sum[k] == sum[k-1] - sum[j] && set.contains(sum[k-1] - sum[j]) {
                    return true
                }
            }
        }
        return false
    }
}