
func findAnagrams(_ s: String, _ p: String) -> [Int] {
    var dict = [Character: Int]()
    for c in p {
        dict[c, default:0] += 1
    }
    var pcount = p.count
    var scount = s.count //each ".count" costs O(n), store the value for loop checking
    var left = 0, right = 0
    var res = [Int]()
    let arrS = Array(s)
    while(right<scount) {
        let w = arrS[right]
        dict[w, default:0] -= 1
        if dict[w]! >= 0 {
            pcount -= 1
        }
        while(dict[w]! < 0) {
            dict[arrS[left]]! += 1
            if dict[arrS[left]]! > 0 {
                pcount += 1
            }
            left += 1
        }
        if pcount == 0 {
            res.append(left)
        }
        right+=1
    }
    
    return res
}

func findAnagrams(_ s: String, _ p: String) -> [Int] {
    var dictP = [Character: Int]()
    var dictS = [Character: Int]()
    var result: [Int] = []
    let s = Array(s)
    let pCount = p.count
    
    for char in p {
        dictP[char, default: 0] += 1
    }
    for i in 0..<s.count { 
        if i >= pCount {
            let char = s[i - pCount]
            dictS[char] = dictS[char]! > 1 ? dictS[char]! - 1 : nil
        }
        
        dictS[s[i], default: 0] += 1
        
        if dictS == dictP {
            result.append(i - pCount + 1)
        } 
    }
    
    return result
}
func findAnagrams(_ s: String, _ p: String) -> [Int] {
    var res = [Int]()
    let s = Array(s)
    var dict = [Character:Int]()
    for s in p {
        dict[s] = dict[s] == nil ? 1 : dict[s]! + 1
    }
    var pcount = p.count
    var scount = s.count
    var right = 0
    var sdict = [Character:Int]()
    while(right<scount){
        if(right>=pcount){
            let c = s[right - pcount]
            sdict[c] = sdict[c]! <= 1 ? nil : sdict[c]! - 1
        }
        sdict[s[right], default: 0] += 1
        
        if sdict == dict {
            res.append(right - pcount + 1)
        }
        
        right+=1
    }
    
    return res
}

func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let sLen = s.utf8.count
        let pLen = p.utf8.count

        guard sLen >= pLen else { return [] }

        var map = [Int](repeating: 0, count: 26)
        p.utf8.forEach({ map[Int($0) - 97] += 1 })

        var left = 0
        var right = 0
        var count = 0

        var result = [Int]()
        let sValues = Array(s.utf8)
        while right < sLen {
            let rightIndex = Int(sValues[right]) - 97
            if map[rightIndex] > 0 {
                map[rightIndex] -= 1
                count += 1
                right += 1
            } else {
                let leftIndex = Int(sValues[left]) - 97
                map[leftIndex] += 1
                count -= 1
                left += 1
            }
            if count == pLen {
                result.append(left)
            }
        }

        return result
    }
    
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var dict = [Character:Int]()
        
        for char in p {
            dict[char,default:0] += 1
        }
        var count = p.count
        var l = 0, r = 0
        var res = [Int]()
        let sArr = Array(s)
        while r < sArr.endIndex {
            let char = sArr[r]
            dict[char,default:0] -= 1
            if dict[char]! >= 0 {
                count -= 1
                if count == 0 {
                    res.append(l)
                    let leftChar = sArr[l]
                    dict[leftChar]! += 1
                    if dict[leftChar]! > 0 {
                        count += 1
                    }
                    l += 1
                }
            }
            while dict[char]! < 0 {
                let leftChar = sArr[l]
                dict[leftChar]! += 1
                if dict[leftChar]! > 0 {
                    count += 1
                }
                l += 1
            }
            r += 1
        }
        return res
    }