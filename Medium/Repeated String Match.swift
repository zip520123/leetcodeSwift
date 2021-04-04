/*Repeated String Match*/
// O(a*(a+b)) O(a*(a+b))
    func repeatedStringMatch(_ a: String, _ b: String) -> Int {
        guard Set(b).isSubset(of: Set(a)) else { return -1 }
        var repeated = a
        var count = 1
        let bcount = b.count
        while repeated.count < bcount {
            repeated += a
            count += 1
        }

        if findSubstr(repeated,b) {
            return count
        } else if findSubstr(repeated + a,b) {
            return count + 1
        } 
        return -1
        
    }
    //O(s*sub) O(1)
    func findSubstr(_ s: String, _ sub: String) -> Bool {
        var l = 0, r = 0
        let sArr = Array(s), s2Arr = Array(sub)
        while l < sArr.endIndex - s2Arr.endIndex + 1 {
            if sArr[l] == s2Arr[r] {
                var left = l, right = r
                while left < sArr.endIndex && right < s2Arr.endIndex {
                    if sArr[left] == s2Arr[right] {
                        left += 1
                        right += 1
                    } else {
                        break
                    }
                }
                if right == s2Arr.endIndex {
                    return true
                }
            }
            l+=1
        }
        return false
    }

//kMP Search O(s+sub) O(sub)
    func findSubstr(_ s: String, _ sub: String) -> Bool {
        let lgs = lgsl(sub)
        var i = 0, j = 0
        let sArr = Array(s), suArr = Array(sub)
        var res = [Int]()
        while i < sArr.endIndex {
            if sArr[i] == suArr[j] {
                i+=1;j+=1
                if j == suArr.endIndex {
                    res.append(i-j)
                    j = lgs[j-1]
                }
            } else {
                if j != 0 {
                    j = lgs[j-1]
                } else {
                    i += 1
                }
            }
            
        }
        return res.endIndex != 0
    }
    
    func lgsl(_ sub: String) -> [Int] {
        var res = [0]
        let sArr = Array(sub)
        var len = 0, i = 1
        while i < sArr.endIndex {
            if sArr[i] == sArr[len] {
                len += 1
                res.append(len)
                i += 1
            } else {
                if len != 0 {
                    len = res[len - 1]
                } else {
                    res.append(0)
                    i += 1
                }
            }
        }
        return res
    }

// c 3
// "abcabcabc"
// "cabcabca"
let input2 = "cabcabca"
let input1 = "abc"
print(repeatedStringMatch(input1, input2))
