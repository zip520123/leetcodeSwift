// Relative Sort Array
// O(n log n), O(n)
func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    var memo = [Int: Int]()
    for i in 0..<arr2.endIndex {
        let n = arr2[i]
        memo[n] = i
    }
    var res1 = [Int]()
    var res2 = [Int]()
    for n in arr1 {
        if memo[n] != nil {
            res1.append(n)
        } else {
            res2.append(n)
        }
    }
    let res = res1.sorted(by: { a, b in memo[a]! < memo[b]! }) + res2.sorted()
    return res
}