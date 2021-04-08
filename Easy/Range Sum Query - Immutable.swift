//Range Sum Query - Immutable
class NumArray {
    var dict = [Int:Int]()
    init(_ nums: [Int]) {
        
        var sum = 0
        for (i,n) in nums.enumerated() {
            dict[i] = sum
            sum += n
        }
        dict[nums.endIndex] = sum
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        dict[right+1]! - dict[left]!
    }
}