//Reordered Power of 2
//O(log n), O(log n)
class Solution {
    func reorderedPowerOf2(_ n: Int) -> Bool {
        let arr = count(n)
        for p in 0..<32 {
            if arr == count(1<<p) {
                return true
            }
        }
        return false
    }
    
    func count(_ n: Int) -> [Int] {
        var n = n
        var arr = (0...9).map{_ in 0}
        while n > 0 {
            arr[n%10] += 1
            n /= 10
        }
        return arr
    }
}