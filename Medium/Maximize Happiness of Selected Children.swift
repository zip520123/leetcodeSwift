// Maximize Happiness of Selected Children
// O(n log n), O(n)
func maximumHappinessSum(_ happiness: [Int], _ k: Int) -> Int {
    let arr = happiness.sorted(by: >)
    var res = 0
    var count = 0
    for i in 0..<k {
        let curr = arr[i] - count
        if curr > 0 {
            res += curr
        }
        count += 1
    }
    return res
}