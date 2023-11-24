// Maximum Number of Coins You Can Get
// O(n log n), O(n)
func maxCoins(_ piles: [Int]) -> Int {
    var res = 0
    var arr = piles.sorted()
    while !arr.isEmpty {
        let alice = arr.removeLast()
        let us = arr.removeLast()
        res += us
        let bob = arr.removeFirst()
    }
    return res
}