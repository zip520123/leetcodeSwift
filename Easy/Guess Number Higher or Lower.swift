/*Guess Number Higher or Lower*/
//O(log n), O(1)
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

func guessNumber(_ n: Int) -> Int {
    var l = 1, r = n
    while l<r {
        let mid = l+(r-l)>>1
        let curr = guess(mid)
        if curr == 1 {
            l = mid+1
        } else if curr == -1 {
            r = mid-1
        } else {
            return mid
        }
    }
    return l
}