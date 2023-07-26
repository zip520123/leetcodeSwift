// Minimum Speed to Arrive on Time
// O(n log k), O(1)
    func minSpeedOnTime(_ dist: [Int], _ hour: Double) -> Int {
        var l = 1, r = Int(1E7)
        var res = -1

        func timeRequired(_ speed: Int) -> Double {
            var time: Double = 0.0
            for i in 0..<dist.endIndex {
                let t = Double(dist[i]) / Double(speed)
                time += i == dist.endIndex-1 ? t : ceil(t)
            }
            return time
        }

        while l <= r {
            let mid = l+((r-l)>>1)
            if timeRequired(mid) <= hour {
                res = mid
                r = mid-1
            } else {
                l = mid + 1
            }
        }
        return res
    }