// Relative Ranks
// O(n log n), O(n)
func findRelativeRanks(_ score: [Int]) -> [String] {
    var scoreToIndex = [Int: Int]()
    let arr = score.sorted(by: >)
    for i in 0..<arr.endIndex {
        scoreToIndex[arr[i]] = i
    }
    var res = [String]()
    for curr in score {
        let index = scoreToIndex[curr]!
        if index == 0 {
            res.append("Gold Medal")
        } else if index == 1 {
            res.append("Silver Medal")
        } else if index == 2 {
            res.append("Bronze Medal")
        } else {
            res.append(String(index+1))
        }
    }
    return res
}