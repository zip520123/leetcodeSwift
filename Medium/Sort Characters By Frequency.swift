//Sort Characters By Frequency
//O(n log n), O(n)
    func frequencySort(_ s: String) -> String {
        var dict = [Character : Int]()
        for char in s {
            dict[char, default:0] += 1
        }
        var res = ""
        let list = dict.sorted {$0.value > $1.value}
        for item in list {
            for n in 0..<item.value {
                res.append(item.key)
            }
        }
        return res
    }

//O(n log n), O(n)
    func frequencySort(_ s: String) -> String {
        var dict = [Character: Int]()
        for char in s {
            dict[char, default: 0] += 1
        }
        let arr = Array(dict).sorted(by: { 
            if $0.value == $1.value {
                return $0.key < $1.key
            }
            return $0.value > $1.value 
        })
        var res = ""
        for (key, value) in arr {
            for _ in 0..<value {
                res += String(key)
            }
        }

        return res
    }