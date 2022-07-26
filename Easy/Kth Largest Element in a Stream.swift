//Kth Largest Element in a Stream
//O(n^2), O(n)
class KthLargest {
    let k: Int
    var arr: [Int] 
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.arr = nums.sorted()
    }
    
    func add(_ val: Int) -> Int {
        var l = 0, r = arr.endIndex
        while l<r {
            let mid = l+(r-l)>>1
            if arr[mid] < val {
                l = mid+1
            } else {
                r = mid
            }
        }
        arr.insert(val, at: l)
        return arr[arr.endIndex-k]
    }
}