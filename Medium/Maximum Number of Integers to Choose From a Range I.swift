// Maximum Number of Integers to Choose From a Range I
// O(n), O(n)
func maxCount(_ banned: [Int], _ n: Int, _ maxSum: Int) -> Int {
    let banned_set = Set(banned)
    var curr = 0
    var res = 0
    for i in 1...n {
        if i + curr > maxSum {
            break
        }
        if banned_set.contains(i) == false {
            curr += i
            res += 1
        }
    }
    return res
}