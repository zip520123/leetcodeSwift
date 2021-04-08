//4Sum II
//O(A*B*C*D)
func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
    var res = 0
    for a in A {
        for b in B {
            for c in C {
                for d in D {
                    if a + b + c + d == 0 {
                        res += 1
                    }
                }
            }
        }
    }
    return res
}
//O(A*B+C*D) O(A*B)
func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        var res = 0
        var dict = Dictionary<Int,Int>()
        for a in A {
            for b in B {
                dict[(a+b),default:0]+=1
            }
        }
        for c in C {
            for d in D {
                if dict[(-(c+d))] != nil {
                    res += dict[(-(c+d))]!
                }
            }
        }
        return res
    }