//Arithmetic Slices II - Subsequence
//O(n^2), O(n^2)
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        var res = 0
        var map = [[Int: Int]](repeating: [:], count: nums.count)
        for i in 0..<nums.endIndex {
            for j in 0..<i {
                let diff = nums[j] - nums[i]
                let c1 = map[i][diff, default:0]
                let c2 = map[j][diff, default:0]
                res += c2
                map[i][diff,default:0] = c1+c2+1
            }
        }
        return res
    }

    //another solution
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        var res = 0
        var map = [[Int:Int]](repeating: [:], count: nums.count)
        for i in 0..<nums.endIndex {
            for j in 0..<i {
                let diff = nums[j] - nums[i]
                let count = map[j][diff, default: 0]

                res += count
                map[i][diff, default: 0] += count + 1
            }
        }
        return res
    }