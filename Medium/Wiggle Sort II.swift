//Wiggle Sort II
    func wiggleSort(_ nums: inout [Int]) {
        let sorted = nums.sorted()
        var large = nums.endIndex - 1
        var small = nums.endIndex >> 1
        if nums.endIndex % 2 == 0{
            small -= 1
        }
        for i in 0..<nums.endIndex {
            if i%2 == 0 {
                nums[i] = sorted[small]
                small -= 1
            } else {
                nums[i] = sorted[large]
                large -= 1
            }
        }
    }

    func wiggleSort(_ nums: inout [Int]) {
        let arr = nums.sorted(by: <)
        var i = arr.endIndex >> 1
        var j = arr.endIndex - 1
        if arr.endIndex % 2 == 0 {
            i -= 1
        }
        for n in 0..<nums.endIndex {
            if n % 2 == 0 {
                nums[n] = arr[i]
                i -= 1
            } else {
                nums[n] = arr[j]
                j -= 1
            }
        }
    }