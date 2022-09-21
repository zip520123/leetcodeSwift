//Sum of Even Numbers After Queries
//O(n), O(n)
    func sumEvenAfterQueries(_ nums: [Int], _ queries: [[Int]]) -> [Int] {
        var nums = nums
        var sum = nums.reduce(0, {$0 + ($1%2 == 0 ? $1 : 0) })
        var res = [Int]()
        for q in queries {
            var i = q[1], val = q[0]
            let curr = nums[i] + val
            if nums[i] % 2 == 0 {
                if curr % 2 == 0 {
                    sum += val
                } else {
                    sum -= nums[i]
                }
            } else {
                if curr % 2 == 0 {
                    sum += curr
                }
            }
            nums[i] = curr
            res.append(sum)
        }
        return res
    }