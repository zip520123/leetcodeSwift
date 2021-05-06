//Longest Repeating Substring
//O(n^2 log n), O(n^2)
    func longestRepeatingSubstring(_ S: String) -> Int {
        let sArr = Array(S)
        func search(_ long: Int) -> Bool {
            var seen = Set<[Character]>()
            var i = 0
            while i < sArr.endIndex - long + 1 {
                let temp = Array(sArr[i..<i+long])
                if seen.contains(temp) {return true}
                seen.insert(temp)
                i += 1
            }
            return false
        }
        
        var l = 1, r = sArr.endIndex - 1
        while l <= r {
            let mid = (l+r)>>1
            if search(mid) {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return l - 1
    }