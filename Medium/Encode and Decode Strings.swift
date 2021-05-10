//Encode and Decode Strings
    func encode(_ strs: [String]) -> String { //O(n)
        var res = ""
        for s in strs {
            res += (String(s.count))
            res += ("/")
            res += (s)
        }
        return res
    }
    
    func decode(_ s: String) -> [String] { //O(n)
        var res = [String]()
        var i = 0
        let sArr = Array(s)
        while i < sArr.endIndex {
            var n = 0
            var j = i
            while let curr = Int(String(sArr[j])) {
                n = n*10 + curr
                j += 1
            }
            if n > 0 {
                let string = String(sArr[j+1...j+n])
                res.append(string)    
            } else {
                res.append("")
            }
            
            i = j+n+1
        }
        return res
    }