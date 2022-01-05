//Pairs of Songs With Total Durations Divisible by 60
//O(n^2), O(n)
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        var dict = [Int: Int](), res = 0
        for t in time {
            for (key, val) in dict {
                if (key+t)%60 == 0 {
                    res += val
                }
            }
            dict[t, default:0] += 1
        }
        return res
    }
//O(n), O(n)
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        var dict = [Int: Int](), res = 0
        for t in time {
            let mod = t % 60
            if mod == 0 {
                res += dict[mod, default:0]
            } else {
                let rest = 60-mod
                res += dict[rest, default:0]
            }
            dict[mod, default:0] += 1
        }
        return res
    }

//O(n), O(n)
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        var dict = [Int: Int](), res = 0
        for t in time {
            let mod = t % 60
            res += dict[mod, default:0]

            let key = mod == 0 ? 0 : 60-mod
            dict[key, default: 0] += 1
           
        }
        return res
    }