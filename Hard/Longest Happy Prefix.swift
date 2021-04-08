//Longest Happy Prefix
//O(n) O(n)
    func longestPrefix(_ s: String) -> String {
        let sArr = Array(s)
        var i = 1, len = 0

        var table = [0]
        while i < sArr.endIndex {
            if sArr[i] == sArr[len] {
                len += 1
                table.append(len)
                i += 1
            } else {
                if len == 0 {
                    table.append(len)
                    i+=1
                } else {
                    len = table[len - 1]
                }
            }
        }

        len = table.last!
        
        return String(sArr[i-len..<i])
    }