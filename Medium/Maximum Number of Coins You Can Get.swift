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

// O(n log n), O(n)
func maxCoins(_ piles: [Int]) -> Int {
    var res = 0
    let arr = piles.sorted()
    let n = arr.endIndex
    var i = n/3
    while i < n {
        res += arr[i]
        i += 2
    }
    return res
}