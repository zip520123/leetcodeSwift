//Set Mismatch
//O(n), O(n)
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var set = Set<Int>()
        var res = [Int]()
        for n in nums {
            if set.contains(n) {
                res.append(n)
            }
            set.insert(n)
        }
        for i in 1...nums.endIndex {
            if set.contains(i) == false {
                res.append(i)
            }
        }
        return res
    }