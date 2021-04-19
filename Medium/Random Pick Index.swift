//Random Pick Index
//O(n) O(n)
class Solution {
    let dict: [Int:[Int]]
    init(_ nums: [Int]) {
        var dict = [Int:[Int]]()
        for (i,n) in nums.enumerated() {
            dict[n,default:[]].append(i)
        }
        self.dict = dict
    }
    
    func pick(_ target: Int) -> Int {
        let arr = dict[target]!
        let index = Int.random(in: 0..<arr.endIndex)
        return arr[index]
    }
}