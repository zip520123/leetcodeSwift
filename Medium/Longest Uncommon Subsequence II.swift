//Longest Uncommon Subsequence II
//O(n log n), O(n)
class Solution {
    func findLUSlength(_ strs: [String]) -> Int {
        let strs = strs.sorted(by: {a,b in a.count > b.count}) 
        let dup = duplicate(strs)
        
        nextStr: for (i,s) in strs.enumerated() {
            if !dup.contains(s) {
                if i == 0 {return s.count}
                for j in 0..<i {
                    if isSub(strs[j], s) {continue nextStr}
                    return s.count
                }
            } 
        }
        return -1
    }
    
    func isSub(_ l: String, _ r: String) -> Bool {
        var i = 0, j = 0
        let lArr = Array(l), rArr = Array(r)
        while i < l.count && j < r.count {
            if lArr[i] == rArr[j] {j += 1}
            i += 1
        }
        return j == r.count
    }
    
    func duplicate(_ strs: [String]) -> Set<String> {
        var exist = Set<String>()
        var duplicate = Set<String>()
        for s in strs {
            if exist.contains(s) {
                duplicate.insert(s)
            }
            exist.insert(s)
        }
        return duplicate
    } 
}