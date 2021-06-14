//Minimum Number of Refueling Stops
//O(n^3), O(n^2), TLE
    func minRefuelStops(_ target: Int, _ startFuel: Int, _ stations: [[Int]]) -> Int {
        if stations.endIndex == 0 && target <= startFuel {return 0}
        
        var stations = [[0, startFuel]] + stations + [[target, 0]]
        var dp = [Int:[[Int]]]()
        
        dp[0] = [[startFuel,0]]
        var res = Int.max
        for i in 0..<stations.endIndex-1 {
            let start = stations[i]
            for item in dp[i, default: []] {
                for j in i+1..<stations.endIndex {
                    
                    let end = stations[j]
                    if start[0] + item[0] >= end[0] {
                        let dis = end[0] - start[0]
                        let remain = item[0] - dis + end[1]
                        if end[0] == target {
                            res = min(res, item[1])
                        } else {
                            dp[j,default:[]].append([remain ,item[1]+1])    
                        }
                    } else {
                        break
                    }
                }
            }
        }
        
        if res == Int.max {
            return -1
        } else {
            return res
        }
    }
    
//O(n^2)
    func minRefuelStops(_ target: Int, _ startFuel: Int, _ stations: [[Int]]) -> Int {
        let n = stations.endIndex
        var dp = (0...n).map {_ in 0}
        dp[0] = startFuel
        for i in 0..<n {
            for t in (0...i).reversed() {
                if dp[t] >= stations[i][0] {
                    dp[t+1] = max(dp[t+1], dp[t] + stations[i][1])
                }
            }
        }
        for i in 0...n {
            if dp[i] >= target {
                return i
            }
        }
        return -1
    }