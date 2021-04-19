//Palindrome Permutation II
//O((n/2+1)!) permutations need to be generated in the worst case.  O(n) The depth of recursion tree can go upto n/2n/2 in the worst case.
class Solution {
    func generatePalindromes(_ s: String) -> [String] {
        var dict = [Character: Int]()
        for char in s {
            dict[char, default:0] += 1
        }
        var leftStrings = [String]()
        var singleChar: Character?
        var chars = [Character]()
        
        for (char, value) in dict {
            if value % 2 == 0 {
                for _ in 0..<value >> 1 {
                    chars.append(char)
                }
            } else {
                if singleChar == nil {
                    singleChar = char
                    for _ in 0..<value >> 1 {
                        chars.append(char)
                    }
                } else {
                    return []
                }
            } 
        }
        
        func dfs(_ path:[Character], _ restChars: [Character]) {
            if restChars.endIndex == 0 {
                leftStrings.append(String(path))
                return
            }
            var restChars = restChars
            var i = 0
            var prev: Character?
            while i < restChars.endIndex {
                let char = restChars.remove(at: i)
                if prev == nil || char != prev! {
                    dfs(path+[char], restChars)    
                }
                restChars.insert(char, at: i)
                prev = char
                i += 1
            }
        }
        
        dfs([],chars)
        
        let res = leftStrings.map { s -> String in
            if let single = singleChar {
                return s + String(single) + s.reversed()
            } else {
                return s + s.reversed()    
            }
        }
        return res 
    }
}