//Maximum Performance of a Team
//O(n (log n + log k)), O(n+k)
    func maxPerformance(_ n: Int, _ speed: [Int], _ efficiency: [Int], _ k: Int) -> Int {
        let speedEfficiencyPair = zip(speed, efficiency).sorted { a, b in a.1 > b.1 }
        let sortedEfficiency = speedEfficiencyPair.map { $0.1 }
        let sortedSpeed = speedEfficiencyPair.map { $0.0 }
        var sum = 0, arr = [Int](), res = 0
        
        for i in 0..<n {
            let currSpeed = sortedSpeed[i]
            let currEiff = sortedEfficiency[i]
            sum += currSpeed
            var l = 0, r = arr.endIndex
            while l<r {
                let mid = (l+r)>>1
                if arr[mid] < currSpeed {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            arr.insert(currSpeed, at: l)
            
            res = max(res, sum*currEiff)
            if i >= k-1 {
                let first = arr.removeFirst()
                sum -= first
            }
        }
        return res % Int(1E9+7)
    }