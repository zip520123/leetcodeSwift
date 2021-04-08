//Largest Number
//O(nlogn)
    func largestNumber(_ nums: [Int]) -> String {
        let nums = nums.sorted {
            a, b in
            String(a) + String(b) > String(b) + String(a)
        }
        if nums[0] == 0 {return "0"}
        return nums.map{String($0)}.joined()
    }