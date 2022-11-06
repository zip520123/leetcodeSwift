//Orderly Queue
//O(n^2), O(n)
/*
If k = 1, only rotations of s are possible, and the answer is the lexicographically smallest rotation.

If k > 1, any permutation of s is possible, and the answer is the letters of s written in lexicographic order.
*/
    func orderlyQueue(_ s: String, _ k: Int) -> String {
        let arr = Array(s)

        if k == 1 {
            var res = s
            for i in 0..<s.count {
                res = min(res, String(arr[i...] + arr[0..<i]))
            }
            return res
        }
        return String(arr.sorted { $0 < $1 })
    }