//Range Sum Query - Mutable
//TLE
class NumArray { 
    var arr = [Int]()
    init(_ nums: [Int]) { //O(n)
        arr = nums
    }
    func update(_ index: Int, _ val: Int) { //O(1)
        arr[index] = val
    }
    func sumRange(_ left: Int, _ right: Int) -> Int { //O(n)
        var sum = 0
        for i in left...right {
            sum += arr[i]
        }
        return sum
    }
}

//TLE
class NumArray {
    var dict = [Int:Int]()
    var arr = [Int]()
    init(_ nums: [Int]) { //O(n)
        arr = nums
        var sum = 0
        for (i,n) in nums.enumerated() {
            sum += n
            dict[i+1] = sum
        }
        dict[0] = 0
    }
    
    func update(_ index: Int, _ val: Int) { //O(n)
        arr[index] = val
        var sum = dict[index]!
        for i in index..<arr.endIndex {
            sum += arr[i]
            dict[i+1] = sum
        }
        
    }    
    
    func sumRange(_ left: Int, _ right: Int) -> Int { //O(1)
        dict[right+1]! - dict[left]!
    }
}