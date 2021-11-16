//Kth Smallest Number in Multiplication Table
//O(m log (m*n)), O(1)
class Solution {
    func findKthNumber(_ m: Int, _ n: Int, _ k: Int) -> Int {
        var l = 1, r = m*n
        while l<r {
            let mid = l+(r-l)>>1
            if !enough(mid, m, n, k) {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return l
    }
    
    func enough(_ x: Int, _ m: Int, _ n: Int, _ k: Int) -> Bool {
        var count = 0
        for i in 1...m {
            count += min(x/i, n)
        }
        return count >= k
    }
}


    func findKthNumber(_ m: Int, _ n: Int, _ k: Int) -> Int {
        func enough(_ x: Int) -> Bool {
            var count = 0
            for i in 1...m {
                count += min(x/i, n)
            }
            return count >= k
        }
        
        var l = 1, r = m*n
        while l<r {
            let mid = l+(r-l)>>1
            if !enough(mid) {
                l = mid+1
            } else {
                r = mid
            }
        }
        return l
    }