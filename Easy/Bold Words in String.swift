//Bold Words in String

    func boldWords(_ words: [String], _ s: String) -> String {
        let sArr = Array(s)
        var mask = [Bool](repeating: false, count: sArr.endIndex)
        for i in 0..<sArr.endIndex {
            next: for word in words {
                let wArr = Array(word)
                var l = i, r = 0
                while l < sArr.endIndex && r < wArr.endIndex {
                    if sArr[l] != wArr[r] {continue next}
                    l += 1
                    r += 1
                }
                if r == wArr.endIndex {
                    for k in i..<l {
                        mask[k] = true
                    }    
                }
            }
        }
        var res = ""
        for i in 0..<sArr.endIndex {
            if mask[i] && (i==0 || !mask[i-1]) {
                res += "<b>"
            }
            res += String(sArr[i])
            if mask[i] && (i==sArr.endIndex-1 || !mask[i+1]) {
                res += "</b>"
            }
        }
        return res
    }
    
//KMP O(s*dict.len) O(s+dict)
class Solution {
    func boldWords(_ words: [String], _ s: String) -> String {
        var intervals = [[Int]]()
        for word in words {
            intervals += substring(s, word)
        }
        intervals.sort { a,b in a[0]<b[0]}
        var l = 0, r = 1
        while r < intervals.endIndex {
            if intervals[l][1] >= intervals[r][0] {
                intervals[l][1] = max(intervals[l][1],intervals[r][1])
                intervals.remove(at: r)
            } else {
                l = r
                r += 1
            }
        }
        var start = 0
        var res = ""
        let sArr = Array(s)
        for interval in intervals {
            res += sArr[start..<interval[0]]
            res += "<b>" + sArr[interval[0]..<interval[1]] + "</b>"
            start = interval[1]
        }
        res += sArr[start...]
        return res
    }
    
    func substring(_ s:String, _ word: String) -> [[Int]] {
        let table = lsp(word)    
        var i = 0, len = 0, res = [[Int]]()
        let sArr = Array(s), wArr = Array(word)
        while i < sArr.endIndex {
            if sArr[i] == wArr[len] {
                i += 1
                len += 1
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
    
    func lsp(_ word: String) -> [Int] {
        var len = 0, i = 1
        var res = [0]
        let wArr = Array(word)
        while i < wArr.endIndex {
            if wArr[i] == wArr[len] {
                len += 1
                res.append(len)
                i += 1
            } else {
                if len == 0 {
                    res.append(0)
                    i += 1
                } else {
                    len = res[len-1]
                }
            }
        }
        return res
    }
    
}