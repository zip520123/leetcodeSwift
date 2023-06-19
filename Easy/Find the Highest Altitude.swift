// Find the Highest Altitude
// O(n), O(1)
func largestAltitude(_ gain: [Int]) -> Int {
    var res = 0, curr = 0
    for n in gain {
        curr += n
        res = max(res, curr)
    }
    return res
}