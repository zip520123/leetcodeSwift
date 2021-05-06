//Find All Numbers Disappeared in an Array
//O(n) O(n)
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var set = Set(nums)
        var res = [Int]()
        for i in 1...nums.endIndex {
            if set.contains(i) == false {
                res.append(i)
            }
        }
        return res
    }
//O(n) O(1)
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        
        var res = nums
        for i in 0..<res.endIndex {
            let n = nums[i]-1
            res[n] = -abs(res[n])
        }
        for i in 0..<res.endIndex {
            if res[i] > 0 {
                res[i] = i+1
            }
        }
        return res.filter {$0>0}
    }