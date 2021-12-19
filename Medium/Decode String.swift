//Decode String
//O(maxK * n) O(n)
/*where maxK is the maximum value of k and n is the length of a given string s. We traverse a string of size n and iterate k times to decode each pattern of form k. This gives us worst case time complexity as*/
func decodeString(_ s: String) -> String {
        var res = ""
        let sArr = Array(s)
        let set = Set<Character>("abcdefghijklmnopqrstuvwxyz")
        var i = 0
        while i < sArr.endIndex {
            let char = sArr[i]
            if set.contains(char) {
                res += String(char)
            } else {
                if Int(String(char)) != nil {
                    var total = Int(String(char))!
                    var l = i + 1
                    while let currNum = Int(String(sArr[l])) {
                        total = total * 10 + currNum
                        l += 1
                    }
                    var r = l+1, leftCount = 1
                    while leftCount > 0 {
                        if sArr[r] == "[" {
                            leftCount += 1
                        }
                        if sArr[r] == "]" {
                            leftCount -= 1
                        }
                        r += 1
                    }
                    r -= 1
                    let s = decodeString(String(sArr[l+1..<r]))
                    
                    for _ in 1...total {
                        res += s
                    }
                    i = r 
                }
            }  
            i += 1
        }
        return res
    }

    //O(k*s), O(s)
        func decodeString(_ s: String) -> String {
        var res = ""
        let arr = Array(s)
        var i = 0
        while i < arr.endIndex {
            if Int(String(arr[i])) != nil {
                var rep = 0
                var l = i
                while let n = Int(String(arr[l])) {
                    rep = rep*10 + n
                    l += 1
                }
                var r = l+1
                var left = 1
                while left > 0 {
                    if arr[r] == "]" {
                        left -= 1
                    }
                    if arr[r] == "[" {
                        left += 1
                    }
                    r += 1
                }
                r -= 1
                let s = decodeString(String(arr[l+1..<r]))
                for _ in 1...rep {
                    res += s
                }
                i = r
            } else {
                 res += String(arr[i])
            }
            
            i += 1
        }
        return res
    }