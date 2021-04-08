// Implement strStr()
// O(n^2) O(1)
func strStr(_ haystack: String, _ needle: String) -> Int {
        let hArr = Array(haystack), nArr = Array(needle)
        if nArr.endIndex > hArr.endIndex {return -1}
        if nArr.endIndex == 0 {return 0}
        for i in 0..<hArr.endIndex {
            var l = i, r = 0
            while l < hArr.endIndex && r < nArr.endIndex && hArr[l] == nArr[r] {
                l += 1
                r += 1
            }
            if r == nArr.endIndex {
                return i
            }
            
        }
        return -1
    }
    //kmp O(n) O(needle)
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let lpst = lpstable(needle)
        let hArr = Array(haystack), nArr = Array(needle)
        if nArr.endIndex == 0 {return 0}
        var i = 0, j = 0
        while i < hArr.endIndex { 
            if hArr[i] == nArr[j] {
                i += 1
                j += 1
                if j == nArr.endIndex {
                    return i - j
                    j = lpst[j - 1]
                }
            } else {
                if j > 0 {
                    j = lpst[j - 1]    
                } else {
                    j = 0
                    i += 1
                }   
            }
        }
        return -1
    }
    
    func lpstable(_ s: String) -> [Int] { 
        var res = [0]
        var i = 1, len = 0
        let sArr = Array(s)
        while i < sArr.endIndex {
            if sArr[i] == sArr[len] {
                len += 1
                res.append(len)
                i += 1
            } else {
                if len > 0 {
                    len = res[len - 1]
                } else {
                    res.append(len)
                    i += 1
                }
            }
        }
        return res
    }
//O(n) O(1)
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        let hArr = Array(haystack), nArr = Array(needle)
        if nArr.endIndex == 0 {return 0}
        if nArr.endIndex > hArr.endIndex {return -1}
        
        nextChar:for i in 0..<hArr.endIndex - nArr.endIndex + 1 {
            if hArr[i] == nArr[0] {
                for j in 1..<nArr.endIndex {
                    if hArr[i+j] != nArr[j] {
                        continue nextChar
                    }
                }
                return i
            }
        }
        return -1
    }

    func strStr(_ haystack: String, _ needle: String) -> [Int] {
        
        let hArr = Array(haystack), nArr = Array(needle)
        if nArr.endIndex == 0 {return [0]}
        if nArr.endIndex > hArr.endIndex {return []}
        var res = [Int]()
        nextChar:for i in 0..<hArr.endIndex - nArr.endIndex + 1 {
            if hArr[i] == nArr[0] {
                for j in 1..<nArr.endIndex {
                    if hArr[i+j] != nArr[j] {
                        continue nextChar
                    }
                }
                res.append(i)
            }
        }
        return res
    }
    let input = "aaaaa"
    let input2 = "ab"
    print(strStr(input, input2))
    