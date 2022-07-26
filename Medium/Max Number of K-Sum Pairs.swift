//Max Number of K-Sum Pairs
//O(n), O(n)
    func maxOperations(_ nums: [Int], _ k: Int) -> Int {
        var dict = [Int: Int]()
        var res = 0
        for n in nums {
            if dict[n, default: 0] > 0 {
                res += 1
                dict[n]! -= 1
            } else {
                dict[k-n, default:0] += 1    
            }
        }
        return res
    }