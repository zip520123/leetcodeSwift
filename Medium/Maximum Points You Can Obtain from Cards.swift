//Maximum Points You Can Obtain from Cards
//TLE O(2^n), n = cardPoints.len
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        var dict = [[Int]: Int]()
        func dfs(_ l:Int,_ r: Int, _ cards: Int, _ currPoint: Int) -> Int {
            if dict[[l,r,cards]] != nil {
                return dict[[l,r,cards]]!
            }
            var points = currPoint
            if cards == k || l > r {return currPoint}
            
            let left = dfs(l+1,r,cards+1, points+cardPoints[l])
            let right = dfs(l,r-1,cards+1, points+cardPoints[r])
            points = max(left, right)
            dict[[l,r,cards]] = points
            return points
        }
        
        return dfs(0, cardPoints.endIndex-1, 0, 0)
    }
//sliding window O(n), O(1), n = cardPoints.len
    func maxScore(_ cards: [Int], _ k: Int) -> Int {
        let sum = cards.reduce(0,+)
        var curr = 0, res = 0
        let window = cards.endIndex-k
        if window <= 0 {return sum}
        for i in 0..<cards.endIndex {
            curr += cards[i]
            if i+1 >= window {
                res = max(res, sum-curr)
                curr -= cards[i+1-window]
            }
        }
        return res
    }

//Queue O(n), O(n)
    func maxScore(_ cards: [Int], _ k: Int) -> Int {
        var queue = [Int]()
        let sum = cards.reduce(0,+)
        var curr = 0, res = 0
        let window = cards.endIndex-k
        if window <= 0 {return sum}
        for i in 0..<cards.endIndex {
            queue.append(cards[i])
            curr += cards[i]
            if queue.endIndex == window {
                res = max(res, sum-curr)
                let first = queue.removeFirst()
                curr -= first
            }
        }
        return res
    }