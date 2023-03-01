//Sort an Array
//O(n log n), O(n) 
    func sortArray(_ nums: [Int]) -> [Int] {
        if nums.endIndex == 0 {return []}
        if nums.endIndex == 1 {return nums}
        let left = (0..<nums.endIndex/2).map { nums[$0] }
        let right = (nums.endIndex/2..<nums.endIndex).map { nums[$0] }
        let l = sortArray(left)
        let r = sortArray(right)
        var res = [Int]()
        var i = 0, j = 0
        while i<l.endIndex && j<r.endIndex {
            if l[i] < r[j] {
                res.append(l[i])
                i += 1
            } else {
                res.append(r[j])
                j += 1
            }
        }
        while i<l.endIndex {
            res.append(l[i])
            i += 1
        }
        while j<r.endIndex {
            res.append(r[j])
            j += 1
        }

        return res
    }