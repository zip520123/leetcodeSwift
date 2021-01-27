/*Product of Array Except Self*/
//time O(n^2) space O(1)
func productExceptSelf(_ nums: [Int]) -> [Int] {
    var res = [Int]()
    var i = 0
    while i < nums.endIndex {
        var product = 1
        for j in 0..<nums.endIndex {
            if j != i {
                product *= nums[j]
            }
        }
        res.append(product)
        i+=1
    }
    
    return res
}

//time O(3n) space O(3n)
func productExceptSelf(_ nums: [Int]) -> [Int] {
    var left = Array<Int>(repeating: 0, count:nums.endIndex)
    var right = Array<Int>(repeating: 0, count:nums.endIndex)
    var res = Array<Int>(repeating: 0, count:nums.endIndex)
    left[0] = 1
    right[nums.endIndex-1] = 1
    for i in 1..<nums.endIndex {
        
        left[i] = left[i-1] * nums[i-1]
    }
    var i = nums.endIndex - 2
    while i >= 0 {
        
        right[i] = right[i+1] * nums[i+1]
        i-=1
    }
    for i in 0..<nums.endIndex {
        res[i] = left[i] * right[i]
    }
    return res
}

//time O(2n) space O(n)
func productExceptSelf(_ nums: [Int]) -> [Int] {
    var res = Array<Int>(repeating: 0, count:nums.endIndex)
    res[0] = 1
    for i in 1..<nums.endIndex {
        
        res[i] = res[i-1] * nums[i-1]
    }
    var r = 1
    var i = nums.endIndex - 1 
    while i >= 0 {
        res[i] = res[i] * r
        r *= nums[i]
        i -= 1
    }
    
    return res
}
func productExceptSelf(_ nums: [Int]) -> [Int] {
    var res = Array<Int>(repeating: 0, count: nums.endIndex)
    res[0] = 1
    for i in 1..<nums.endIndex {
        res[i] = res[i-1]*nums[i-1]
    }
    var r = 1
    for i in (0..<nums.endIndex).reversed() {
        
        res[i] *= r
        r *= nums[i]
    }
    return res
    
}