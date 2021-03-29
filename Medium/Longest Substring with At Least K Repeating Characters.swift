/*Longest Substring with At Least K Repeating Characters*/
//time O(n^2*26) space O(26) 
func longestSubstring(_ s: String, _ k: Int) -> Int {
    var res = 0
    let sArr = Array(s)
    for i in 0..<sArr.endIndex {
        var dict = [Character:Int]()
        next: for j in i..<sArr.endIndex {
            dict[sArr[j], default: 0] += 1
            for (_,value) in dict {
                if value < k {
                    continue next
                }
            } 
            res = max(res, j - i + 1)
        }
    }
    return res
}

//time O(n^2) space O(26) Divide And Conquer prevent redundant operation accept 
func longestSubstring(_ s: String, _ k: Int) -> Int {
    let sArr = Array(s)
    if sArr.endIndex == 0 || sArr.endIndex < k {return 0}
    if k <= 1 {return sArr.endIndex}
    
    var dict = [Character: Int]()
    for char in sArr {
        dict[char,default:0] += 1
    }
    var index = 0
    while index < sArr.endIndex && dict[sArr[index]]! >= k {
        index += 1
    }
    if index == sArr.endIndex {return index}
    
    let left = longestSubstring(String(sArr[0..<index]), k)

    while index < sArr.endIndex && dict[sArr[index]]! < k {
        index += 1
    }
            
    let right = longestSubstring(String(sArr[index..<sArr.endIndex]), k)
    return max(left,right)
}