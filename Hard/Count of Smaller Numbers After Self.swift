//Count of Smaller Numbers After Self
//O(n^2) 
    func countSmaller(_ nums: [Int]) -> [Int] {
        var res = [Int]()
        for i in 0..<nums.endIndex {
            var count = 0
            for j in i+1..<nums.endIndex {
                if nums[i] > nums[j] {
                    count += 1
                }
            }
            res.append(count)
        }
        return res
    }