//Kids With the Greatest Number of Candies
//O(n), O(n)
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        var res = [Bool]()
        let maxCandies = candies.max()!
        for i in 0..<candies.endIndex {
            if candies[i] + extraCandies >= maxCandies {
                res.append(true)
            } else {
                res.append(false)
            }
        }
        return res
    }