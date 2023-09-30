// 132 Pattern
// O(n^2), O(1), TLE
    func find132pattern(_ nums: [Int]) -> Bool {
        var i = 0
        while i<nums.endIndex-2 {
            var j = i+1
            while j<nums.endIndex-1 && nums[j] > nums[i] {
                var k = j+1
                while k<nums.endIndex {

                    if nums[k] > nums[i] && nums[k] < nums[j] {
                        return true
                    }
                    k += 1
                }
                j += 1
            }
            i += 1
        }
        return false
    }
// O(n), O(n)
    func find132pattern(_ nums: [Int]) -> Bool {
        var stack = [Int]()
        var third = Int.min
        for n in nums.reversed() {
            if n < third {return true}
            while !stack.isEmpty && stack.last! < n {
                third = stack.removeLast()
            }
            stack.append(n)
        }
        return false
    }
