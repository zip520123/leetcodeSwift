//Reverse Only Letters
//O(n), O(n)
    func reverseOnlyLetters(_ s: String) -> String {
        var res = [Character]()
        var queue = [Character]()
        for char in s {
            switch char {
                case "A"..."Z", "a"..."z":
                    queue.append(char)
                    res.append("\\")
                default:
                    res.append(char)
            }
        }
        queue = queue.reversed()
        var i = 0, j = 0
        while i < queue.endIndex {
            if res[j] == "\\" {
                res[j] = queue[i]
                i += 1
            }
            j += 1
        }
        return String(res)
    }
    
//O(n), O(n)
    func reverseOnlyLetters(_ s: String) -> String {
        var res = ""
        var j = s.count-1
        let sArr = Array(s)
        
        for (i, char) in s.enumerated() {
            switch char {
                case "A"..."Z", "a"..."z":
                    while !(("A"..."Z").contains(sArr[j]) || ("a"..."z").contains(sArr[j])) {
                        j -= 1
                    }
                    res += String(sArr[j])
                    j -= 1
                default:
                    res += String(char) 
            }
        }
        
        return res
    }