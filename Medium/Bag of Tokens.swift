//Bag of Tokens
//O(n log n), O(n)
    func bagOfTokensScore(_ tokens: [Int], _ power: Int) -> Int {
        var score = 0, power = power
        let arr = tokens.sorted()
        var l = 0, r = arr.endIndex-1
        var res = 0
        while l<=r {
            if arr[l] <= power {
                score += 1
                power -= arr[l]
                l += 1
                res = max(res, score)
            } else {
                if score > 0 {
                    score -= 1
                    power += arr[r]
                    r -= 1
                } else {
                    return res
                }
            }
        }
        return res
    }