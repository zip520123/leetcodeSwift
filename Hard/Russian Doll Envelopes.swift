//Russian Doll Envelopes
//O(n log n), O(n)
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        var arr = envelopes.sorted { a, b in 
            if a[0] == b[0] {
                return a[1] > b[1]
            } else {
                return a[0] < b[0] 
            }
                                   }
        var dp = [Int]()
        for item in arr {
            var l = 0, r = dp.endIndex
            while l<r {
                let mid = l+(r-l)>>1
                if dp[mid] < item[1] {
                    l = mid+1
                } else {
                    r = mid
                }
            }
            if l == dp.endIndex {
                dp.append(item[1])
            } else {
                dp[l] = item[1]
            }
        }
        
        return dp.count
    }