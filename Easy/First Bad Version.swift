/*First Bad Version*/
//O(log n) space O(1)
func firstBadVersion(_ n: Int) -> Int {
    
    var l = 1, r = n
    while l < r {
        let mid = (l + r) >> 1
        if isBadVersion(mid) == false {
            l = mid + 1
        } else {
            r = mid
        }
    
    }
    return l
}