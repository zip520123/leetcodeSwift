//Wiggle Sort
//O(n log n)
    func wiggleSort(_ nums: inout [Int]) {
        nums.sort(by: <)
        var i = 1
        while i < nums.endIndex - 1 {
            (nums[i],nums[i+1]) = (nums[i+1],nums[i])
            i += 2
        }   
    }
//O(n)
    func wiggleSort(_ nums: inout [Int]) {
        for i in 0..<nums.endIndex-1 {
            if i % 2 == 0 {
                if nums[i] > nums[i+1] {
                    (nums[i],nums[i+1]) = (nums[i+1],nums[i])
                }    
            } else {
                if nums[i] < nums[i+1] {
                    (nums[i],nums[i+1]) = (nums[i+1],nums[i])
                }
            }   
        }
    }