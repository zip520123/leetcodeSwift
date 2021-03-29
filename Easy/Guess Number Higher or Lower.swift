/*Guess Number Higher or Lower*/
func guessNumber(_ n: Int) -> Int {
    
    var l = 1, r = n
    while l < r {
        let mid = (l+r) >> 1
        if guess(mid) == 1 {
            l = mid + 1
        } else {
            r = mid
        }
    }
    return l
}