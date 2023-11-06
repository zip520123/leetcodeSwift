// Last Moment Before All Ants Fall Out of a Plank
// O(n), O(1)
func getLastMoment(_ n: Int, _ left: [Int], _ right: [Int]) -> Int {
    var res = 0
    for num in left {
        res = max(res, num)
    }
    for num in right {
        res = max(res, n-num)
    }
    return res
}