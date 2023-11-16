// Find Unique Binary String
// O(n), O(n)
func findDifferentBinaryString(_ nums: [String]) -> String {
    let n = nums.endIndex
    var set = Set<String>(nums)

    func toBinary(_ num: Int) -> String {
        var num = num
        var res = ""
        for i in 0..<n {
            res = String(num & 1) + res
            num >>= 1
        }
        return res
    }
    let maxN: Int = Int(pow(2.0, Double(n)))
    for i in 0..<maxN {
        let curr = toBinary(i)
        if set.contains(curr) == false {
            return curr
        }
    }
    return ""
}