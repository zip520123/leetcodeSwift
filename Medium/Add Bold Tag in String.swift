//Add Bold Tag in String
//O(s*dict.len) O(s+dict)


    func addBoldTag(_ s: String, _ dict: [String]) -> String {
        
        let sArr = Array(s)
        var intervals = [[Int]]()
        
        for word in dict {
            intervals += substring(s,word) 
        }

        var res = ""
        var mask = [Bool](repeating: false, count: sArr.endIndex)
        
        for interval in intervals {
            for i in interval[0]..<interval[1] {
                mask[i] = true    
            }
        }
        
        for (i,char) in sArr.enumerated() {
            if mask[i] == true && (i == 0 || mask[i-1] == false) {
                res += "<b>"
            }    
            res += String(char)
            if mask[i] == true && (i == sArr.endIndex-1 || mask[i+1] == false) {
                res += "</b>"
            }
        }
        
        return res
    }

class Solution {

    func addBoldTag(_ s: String, _ dict: [String]) -> String {
        
        let sArr = Array(s)
        var intervals = [[Int]]()
        
        for word in dict {
            intervals += substring(s,word) 
        }
        intervals.sort {a,b in a[0] < b[0]}
        
        var l = 0, r = 1
        while r < intervals.endIndex {
            if intervals[l][1] >= intervals[r][0] {
                intervals[l][1] = max(intervals[l][1], intervals[r][1])
                intervals.remove(at:r)
            } else {
                l = r
                r += 1    
            }
        }
        
        var start = 0
        var res = ""
        
        for interval in intervals {
            res += sArr[start..<interval[0]]
            res += "<b>"+sArr[interval[0]..<interval[1]]+"</b>"
            start = interval[1]
        }
        res += sArr[start...]
        
        return res
    }
    
    func substring(_ s: String, _ word: String) -> [[Int]] { //KMP search substring
        let table = lsp(word)
        let sArr = Array(s), wArr = Array(word)
        var i = 0, len = 0
        var res = [[Int]]()
        while i < sArr.endIndex {
            if sArr[i] == wArr[len] {
                len += 1
                i += 1
                if len == wArr.endIndex {
                    res.append([i-len,i])
                    len = table[len-1]
                }
            } else {
                if len == 0 {
                    i += 1
                } else {
                    len = table[len-1]
                }
            }
            
        }
        return res
    }
    
    func lsp(_ pat: String) -> [Int] {
        var res = [0]
        var len = 0, i = 1
        let pArr = Array(pat)
        while i < pArr.endIndex {
            if pArr[i] == pArr[len] {
                len += 1
                res.append(len)
                i += 1
            } else {
                if len == 0 {
                    res.append(0)
                    i += 1
                } else {
                    len = res[len - 1]
                }
            }
        }
        return res
    }
}