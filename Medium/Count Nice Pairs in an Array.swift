// Count Nice Pairs in an Array
// O(n), O(n)
func countNicePairs(_ nums: [Int]) -> Int {
    func rev(_ n: Int) -> Int {
        var res = 0
        var n = n
        while n > 0 {
            res = res * 10 + n % 10
            n /= 10
        }
        return res
    }

    var arr = [Int]()
    for n in nums {
        arr.append(n-rev(n))
    }
    var dict = [Int: Int]()
    var res = 0
    for n in arr {
        res = (res + dict[n, default: 0]) % Int(1E9+7)
        dict[n, default:0] += 1
    }
    return res
}