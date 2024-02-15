// Rearrange Array Elements by Sign
// O(n), O(n), TLE
    func rearrangeArray(_ nums: [Int]) -> [Int] {
        let n = nums.endIndex
        var q1 = [Int]()
        var q2 = [Int]()
        for n in nums {
            if n > 0 {q1.append(n)}
            if n < 0 {q2.append(n)}
        }
        var res = [Int]()
        while !q1.isEmpty, !q2.isEmpty {
            res.append(q1.removeFirst())
            res.append(q2.removeFirst())
        }
        return res
    }

// O(n), O(n)
    func rearrangeArray(_ nums: [Int]) -> [Int] {
        let n = nums.endIndex
        var q1 = [Int]()
        var q2 = [Int]()
        for n in nums {
            if n > 0 {q1.append(n)}
            if n < 0 {q2.append(n)}
        }
        var res = [Int]()
        var i = 0, j = 0
        while i < q1.endIndex, j < q2.endIndex {
            res.append(q1[i])
            res.append(q2[j])
            i += 1
            j += 1
        }
        return res
    }