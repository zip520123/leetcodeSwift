// Minimum Limit of Balls in a Bag
// O(n log n), O(1)
func minimumSize(_ nums: [Int], _ maxOperations: Int) -> Int {
    var l = 1, r = 0
    for n in nums {
        r = max(r, n)
    }
    while l<r {
        let mid = l+((r-l)>>1)
        var curr_op = 0
        for n in nums {
            if n > mid {
                curr_op += Int(ceil(Double(n)/Double(mid))) - 1
                if curr_op > maxOperations {
                    break
                }
            }
        }

        if curr_op > maxOperations {
            l = mid + 1
        } else {
            r = mid
        }
    }
    return l
}