//Find the Celebrity
//O(n^2) O(n) TLE
class Solution : Relation {
    func findCelebrity(_ n: Int) -> Int {
        var knowSomeone = [Int:Int]()
        var someoneKnow = [Int:Int]()
        for a in 0..<n {
            for b in 0..<n {
                if a != b {
                    if knows(a,b) {
                        knowSomeone[a, default:0] += 1
                        someoneKnow[b, default:0] += 1
                    }
                }
            }
        }
        for i in 0..<n {
            if knowSomeone[i,default:0] == 0 && someoneKnow[i, default:0] == n - 1 {
                return i
            }
        }
        return -1
    }
}
//O(n)
class Solution : Relation {
    func findCelebrity(_ n: Int) -> Int {
        var l = 0, r = 1 
        while r < n {
            if knows(l,r) {
                l = r
            }
            r += 1
        }
        for i in 0..<n {
            if i != l {
                if knows(i,l) == false || knows(l,i) {
                    return -1
                }
            }
        }
        
        return l
    }
}