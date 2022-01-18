//Maximize Distance to Closest Person
//O(n), O(3n)
    func maxDistToClosest(_ seats: [Int]) -> Int {
        var prev = Int.max
        var dp1 = seats.map { _ in 0 }
        for (i,n) in seats.enumerated() {
            if n == 1 {
                prev = 0
            } else {
                if prev == Int.max {
                    dp1[i] = Int.max    
                } else {
                    prev += 1
                    dp1[i] = prev
                }
                
            }
        }
        prev = Int.max
        var dp2 = seats.map {_ in 0}
        for (i, n) in seats.enumerated().reversed() {
            if n == 1 {
                prev = 0
            } else {
                if prev == Int.max {
                    dp2[i] = Int.max
                } else {
                    prev += 1
                    dp2[i] = prev    
                }
            }
        }
        var res = 0
        for i in 0..<seats.endIndex {
            res = max(res, min(dp1[i], dp2[i]))
        }
        return res
    }