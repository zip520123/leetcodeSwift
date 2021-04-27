//Count Binary Substrings
//O(n) O(n)
    func countBinarySubstrings(_ s: String) -> Int {
        let sArr = Array(s)
        var char = sArr[0]
        var group = [0]
        for curr in s {
            if char == curr {
                group[group.endIndex-1]+=1
            } else {
                char = curr
                group.append(1)
            }
        }
        var res = 0
        for i in 0..<group.endIndex - 1 {
            res += min(group[i], group[i+1])
        }
        return res
    }
//O(n) O(1)
    func countBinarySubstrings(_ s: String) -> Int {
        let sArr = Array(s)
        var char = sArr[0]
        var prev = 0, curr = 0
        
        var res = 0
        for currChar in s {
            if char == currChar {
                curr += 1
            } else {
                res += min(prev, curr)
                prev = curr
                char = currChar
                curr = 1
            }
        }
        return res + min(prev,curr)
    }