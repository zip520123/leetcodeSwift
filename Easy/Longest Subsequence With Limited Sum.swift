//Longest Subsequence With Limited Sum
//O(n log n), O(n) 
    func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
        var res = [Int]()
        let nums = nums.sorted()
        for query in queries {
            var curr = 0, count = 0
            for n in nums {
                if curr + n <= query {
                    count += 1
                    curr += n
                }
            }
            res.append(count)
        }
        return res
    }