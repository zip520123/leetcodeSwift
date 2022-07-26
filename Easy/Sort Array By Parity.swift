//Sort Array By Parity
//O(n), O(n)
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var res = [Int]()
        for n in nums {
            if n % 2 == 1 {
                res.append(n)
            } else {
                res.insert(n, at: 0)
            }
        }
        return res
    }