// Find Champion II
// O(n), O(n)
func findChampion(_ n: Int, _ edges: [[Int]]) -> Int {
    var memo = [Int: Int]()
    for edge in edges {
        memo[edge[1], default: 0] += 1
    }
    var arr = [Int]()
    for node in 0..<n {
        if memo[node, default: 0] == 0 {
            arr.append(node)
        }
    }
    if arr.endIndex > 1 {
        return -1
    }
    return arr[0]
}