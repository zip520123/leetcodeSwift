/*Missing Number*/
//sort time O(n log n), space O(n)
func missingNumber(_ nums: [Int]) -> Int {
    let nums = nums.sorted()
    for (index,n) in nums.enumerated() {
        if n != index {
            return index
        }
    }
    return nums.endIndex
}
//hash time O(n) space O(n)
func missingNumber(_ nums: [Int]) -> Int {
    var set = Set(nums)
    for i in 0..<nums.endIndex {
        if set.contains(i) == false {
            return i
        }
    }
    return nums.endIndex
}
//bit time O(n) space O(1)
func missingNumber(_ nums: [Int]) -> Int {
    var res = 0
    for i in 0..<nums.endIndex {
        res = res ^ i
        res = res ^ nums[i]
    }
    res = res ^ nums.endIndex
    return res
}

func missingNumber(_ nums: [Int]) -> Int {
    var k = (0...nums.endIndex).reduce(0, ^)
    for n in nums {
        k ^= n
    }
    return k
}

//Gauss' Formula (1+n)*n / 2 time O(N) space O(1)
func missingNumber(_ nums: [Int]) -> Int {
    let count = nums.endIndex
    var sum = (count * (count+1)) / 2    
    for n in nums {
        sum -= n
    }
    return sum
}