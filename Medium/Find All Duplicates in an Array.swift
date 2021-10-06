//Find All Duplicates in an Array
//O(n),O(n)
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var dict = [Int:Int]()
        for n in nums {
            dict[n,default:0]+=1
        }
        var res = [Int]()
        for (key, value) in dict {
            if value == 2 {
                res.append(key)
            }
        }
        return res
    }
//O(n), O(1) or O(n)
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var nums = nums, res = [Int]()
        for i in 0..<nums.endIndex {
            let n = abs(nums[i]) - 1
            if nums[n] < 0 {
                res.append(abs(nums[i]))
            }
            nums[n] = -nums[n]
        }
        return res
    }