//Rotate Array
    func rotate(_ nums: inout [Int], _ k: Int) {
        if k == 0 { return }
        var k = k % nums.endIndex
        nums = Array(nums[nums.endIndex - k..<nums.endIndex] + nums[0..<nums.endIndex-k])
    }

    //O(n) O(1)
    func rotate(_ nums: inout [Int], _ k: Int) {
        let k = k % nums.endIndex
        func reverse(_ l:Int, _ r: Int) {
            var l = l , r = r
            while l < r {
                (nums[l] , nums[r]) = (nums[r] , nums[l])
                l += 1
                r -= 1
            }
        }
        
        reverse(0, nums.endIndex - 1)
        reverse(0, k - 1)
        reverse(k, nums.endIndex - 1)
    }