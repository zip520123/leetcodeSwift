// Least Number of Unique Integers after K Removals
// O(n log n), O(n)
func findLeastNumOfUniqueInts(_ arr: [Int], _ k: Int) -> Int {
    var memo = [Int: Int]()
    for n in arr {
        memo[n, default: 0] += 1
    }   
    var arr = [(Int, Int)]()
    for (key, val) in memo {
        arr.append((key, val))
    }
    arr.sort { a, b in a.1 < b.1 }
    var i = 0
    var k = k
    while i < arr.endIndex, arr[i].1 <= k {
        k -= arr[i].1
        i += 1
    }
    return arr.endIndex - i
}