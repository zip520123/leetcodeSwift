//Slowest Key
//O(n), O(n)
    func slowestKey(_ releaseTimes: [Int], _ keysPressed: String) -> Character {
        let sArr = Array(keysPressed)
        var dict = [Character: Int]()
        var currTime = 0
        
        for i in 0..<releaseTimes.endIndex {
            let char = sArr[i]
            let t = releaseTimes[i] - currTime
            currTime = releaseTimes[i]
            dict[char] = max(dict[char,default:0], t)
        }

        var max = dict[sArr[0]]!
        var res = sArr[0]
        
        for (key, value) in dict {
            if value > max {
                max = value
                res = key
            } else if value == max && key > res {
                res = key
            }
        }
        return res
    }