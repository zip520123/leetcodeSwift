//Sign of the Product of an Array
//O(n), O(1)
    func arraySign(_ nums: [Int]) -> Int {
        var curr = 1
        for n in nums {
            curr = (curr * n) 
            if curr > 0 {
                curr = 1
            } else if curr == 0 {
                curr = 0
            } else {
                curr = -1
            }
        }
        return curr
    }