//Subarray Sums Divisible by K
//O(n+k), O(k)
    func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {
        var preMod = 0, res = 0
        var dict = [0:1]
        for n in nums {
            preMod = (preMod+n % k + k) % k
            res += dict[preMod, default:0]
            dict[preMod, default:0] += 1
        }
        return res
    }