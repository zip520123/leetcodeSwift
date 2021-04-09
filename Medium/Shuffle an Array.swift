//Shuffle an Array
class Solution {
    let arr : [Int]
    init(_ nums: [Int]) {
        arr = nums
    }
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return arr
    }
    
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        var sArr = arr
        for i in 0..<arr.endIndex {
            let j = Int.random(in: i..<arr.endIndex)
            (sArr[i],sArr[j]) = (sArr[j],sArr[i])
            
        }
        return sArr
    }
}