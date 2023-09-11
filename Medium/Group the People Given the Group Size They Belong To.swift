// Group the People Given the Group Size They Belong To
// O(n), O(n)
func groupThePeople(_ groupSizes: [Int]) -> [[Int]] {
    var res = [[Int]]()
    var dict = [Int: [Int]]()
    for (i, n) in groupSizes.enumerated() {
        if dict[n] == nil {
            dict[n] = [Int]()
        }
        dict[n]!.append(i)
        if dict[n]!.count == n {
            res.append(dict[n]!)
            dict[n] = [Int]()
        }
    }
    return res
}