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
    func fourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
        var res = 0
        var dict = [Int: Int]()
        for a in nums1 {
            for b in nums2 {
                dict[a+b, default: 0] += 1
            }
        }
        for c in nums3 {
            for d in nums4 {
                res += dict[-(c+d), default: 0]
            }
        }
        return res
    }