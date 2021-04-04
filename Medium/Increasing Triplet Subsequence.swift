/*Increasing Triplet Subsequence*/
//time O(n) space O(1)
    func increasingTriplet(_ nums: [Int]) -> Bool {
        var v1 = Int.max, v2 = Int.max
        for n in nums {
            if n < v1 {
                v1 = n
            } else if n < v2 {
                v2 = n
            } else {
                return true
            }
        }
        return false
    }