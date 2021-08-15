/*Minimum Window Substring*/
//time O(s+t) space O(1) or O(s+t)
func minWindow(_ s: String, _ t: String) -> String {
    var dict = [Character: Int]()
    for c in t {
        dict[c,default:0] += 1
    }
    let scount = s.count
    var tcount = t.count
    if scount < tcount {return ""}
    let sArr = Array(s)
    var left = 0, right = 0
    var minLength = Int.max
    var minStart = 0
    while(right<scount) {
        let c = sArr[right]
        dict[c,default:0] -= 1

        if dict[c,default:0] >= 0 {
            tcount -= 1
            while(tcount == 0) {
                if right - left < minLength {
                    minLength = right - left
                    minStart = left
                }
                let c2 = sArr[left]
                dict[c2,default:0] += 1
                if dict[c2]! > 0 {
                    tcount += 1
                }
                left += 1
            }
        } 
        right+=1
    }
    return minLength == Int.max ? "" : String(sArr[minStart...minStart + minLength])
}
let input = "ADOBECODEBANC"
let input2 = "ABC"
print(minWindow(input, input2))

func minWindow(_ s: String, _ t: String) -> String {
    var dict = [Character:Int]()
    var count = 0
    for char in t {
        count += 1
        dict[char, default:0] += 1
    }
    var l = 0, r = 0
    let sArr = Array(s)
    var length = Int.max
    var start = 0
    while r < sArr.endIndex {
        dict[sArr[r],default:0] -= 1
        if dict[sArr[r]]! >= 0 {
            count -= 1
            
            while count == 0 {
                if length > r - l + 1 {
                    length = r - l + 1
                    start = l
                }
                dict[sArr[l]]! += 1 
                if dict[sArr[l]]! > 0 {
                    count += 1
                }
                l += 1
            }
        }
        r += 1
    }
    return length == Int.max ? "" : String(sArr[start..<start+length])
}

    func minWindow(_ s: String, _ t: String) -> String {
        var dict = [Character: Int]()
        var count = t.count
        for char in t {
            dict[char, default:0] += 1
        }
        var l = 0, r = 0
        var len = Int.max, start = 0
        let sArr = Array(s)
        while r < sArr.endIndex {
            let char = sArr[r]
            dict[char, default:0] -= 1
            if dict[char]! >= 0 {
                count -= 1
            }
            while count == 0 {
                if r-l+1 < len {
                    len = r-l+1
                    start = l
                }
                let leftChar = sArr[l]
                dict[leftChar]! += 1
                if dict[leftChar]! > 0 {
                    count += 1
                }
                l += 1
            }
            
            r += 1
        }
        if len == Int.max {return ""}
        return String(sArr[start..<start+len])
    }

    func minWindow(_ s: String, _ t: String) -> String {
        var dict = [Character: Int]()
        var count = t.count
        for char in t {
            dict[char, default:0] += 1
        }
        let sArr = Array(s)
        var l = 0, r = 0, start = 0, length = Int.max
        while r < sArr.endIndex {
            let char = sArr[r]
            dict[char, default:0] -= 1
            if dict[char]! >= 0 {
                count -= 1
                while count == 0 {
                    if length > r-l {
                        length = r-l
                        start = l
                    }
                    let leftChar = sArr[l]
                    dict[leftChar]! += 1
                    if dict[leftChar]! > 0 {
                        count += 1
                    }
                    l += 1
                }
            }
            r += 1
        }
        if length == Int.max {
            return ""
        }
        return String(sArr[start...start+length])
    }