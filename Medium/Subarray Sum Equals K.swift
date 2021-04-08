/*Subarray Sum Equals K*/
//time O(n^3) space O(1)
func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var res = 0
    
    for i in 0..<nums.endIndex {
        for j in i+1...nums.endIndex {
            var sum = 0
            for r in i..<j {
                sum += nums[r]
            }
            if sum == k {res += 1}
        }    
    }
    return res
}

//time O(n^2) space O(n)
func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var res = 0
    var sum = [0]
    for i in 1...nums.endIndex {
        sum.append(sum[i-1] + nums[i-1])
    }
    
    for i in 0..<nums.endIndex {
        for j in i+1...nums.endIndex {
            if sum[j] - sum[i] == k {
                res += 1
            }
        }    
    }
    return res
}

//time O(n^2) space O(1)
func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var res = 0
    for i in 0..<nums.endIndex {
        var sum = 0
        for j in i..<nums.endIndex {
            sum += nums[j]
            if sum == k {
                res += 1
            }
        }
    }
    return res
}

//time O(n) space O(n)
//we just need to go through the array, calculate the current sum and save number of all seen PreSum to a HashMap.
func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    //sum[i,j] = sum[0,j] - sum[0,i - 1]
    var dict = [Int:Int]()
    dict[0] = 1
    var sum = 0
    var res = 0

    for n in nums {
        sum += n
        if dict[sum - k] != nil {
            res += dict[sum - k]!
        }
        dict[sum, default: 0] += 1
    }
    return res
}