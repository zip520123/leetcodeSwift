/*Find All Anagrams in a String
Given a string s and a non-empty string p, find all the start indices of p's anagrams in s.

Strings consists of lowercase English letters only and the length of both strings s and p will not be larger than 20,100.

The order of output does not matter.

Example 1:

Input:
s: "cbaebabacd" p: "abc"

Output:
[0, 6]

Explanation:
The substring with start index = 0 is "cba", which is an anagram of "abc".
The substring with start index = 6 is "bac", which is an anagram of "abc".
Example 2:

Input:
s: "abab" p: "ab"

Output:
[0, 1, 2]

Explanation:
The substring with start index = 0 is "ab", which is an anagram of "ab".
The substring with start index = 1 is "ba", which is an anagram of "ab".
The substring with start index = 2 is "ab", which is an anagram of "ab".*/

func findAnagrams(_ s: String, _ p: String) -> [Int] {
    var res = [Int]()
    var dict = [String:Int]()
    for c in p {
        let s = String(c)
        dict[s] = dict[s] == nil ? 1 : dict[s]! + 1
    }
    var count = p.count
    var left = 0, right = 0
    let arrS = Array(s)
    while(right<s.count){
        let w = String(arrS[right])
        if(dict[w] == nil) {
            dict[w] = 0
        }
        if(dict[w]! > 0){
            count-=1
        }
        dict[w]!-=1
        while(dict[w]!<0){
            let leftW = String(arrS[left])
            dict[leftW]!+=1
            if(dict[leftW]!>0){count+=1}
            left+=1
        }
        if(count==0){res.append(left)}
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
// let input1 = "cbaebabacd"
// let input2 = "abc"

let input1 = "abab"
let input2 = "ab"
print(findAnagrams(input1, input2))