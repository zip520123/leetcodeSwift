//Group Shifted Strings
//O(strings.length * string.length)
    func groupStrings(_ strings: [String]) -> [[String]] {
        var dict = [String:[String]]()
        
        for s in strings {
            let sArr = Array(s)
            var key = ""
            for i in 1..<sArr.endIndex {
                var diff = Int(sArr[i].asciiValue!) - Int(sArr[i-1].asciiValue!) 
                if diff < 0 {diff += 26}
                key += String(diff) + ","
            }
            dict[key, default:[]].append(s)
        }
        return Array(dict.values)
    }

// O(n), O(n)
    func groupStrings(_ strings: [String]) -> [[String]] {
        var memo = [[Int]:[String]]()
        for s in strings {
            var arr = [Int]()
            let sArr = Array(s)
            for i in 0..<sArr.endIndex-1 {
                var diff = Int(sArr[i].asciiValue!) - Int(sArr[i+1].asciiValue!)
                if diff < 0 {diff += 26}
                arr.append(diff)
            }
            memo[arr, default: []].append(s)
        }
        return Array(memo.values)
    }