// Sort Integers by The Number of 1 Bits
// O(n log n), O(n)
func sortByBits(_ arr: [Int]) -> [Int] {

    func count1(_ n: Int) -> Int {
        var n = n
        var count = 0
        while n > 0 {
            count += n & 1
            n >>= 1
        }
        return count
    }
    let sortedArr = arr.sorted { a,b in 
        let c1 = count1(a)
        let c2 = count1(b)
        if c1 == c2 {return a < b}
        return c1 < c2
    }

    return sortedArr
}