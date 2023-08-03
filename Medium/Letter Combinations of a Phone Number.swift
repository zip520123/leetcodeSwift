/* Letter Combinations of a Phone Number
Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

Example 1:

Input: digits = "23"
Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
Example 2:

Input: digits = ""
Output: []
Example 3:

Input: digits = "2"
Output: ["a","b","c"]
 

Constraints:

0 <= digits.length <= 4
digits[i] is a digit in the range ['2', '9'].*/
class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 0 { return [] }
        var res = [""]
        
        let dict: [Character : String] = 
            ["2" : "abc",
             "3" : "def",
             "4" : "ghi",
             "5" : "jkl",
             "6" : "mno",
             "7" : "pqrs",
             "8" : "tuv",
             "9" : "wxyz"]

        for digit in digits {
            if let letters = dict[digit] {
                let temp = res.map{$0}
                res.removeAll()
                for s in temp {
                    for letter in letters {
                        res.append(s+String(letter))
                    }
                }
            }
        }
        return res
    }
}

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 0 {return []}
        var res = [String]()
        let dict: [Character : String] = 
            ["2" : "abc",
             "3" : "def",
             "4" : "ghi",
             "5" : "jkl",
             "6" : "mno",
             "7" : "pqrs",
             "8" : "tuv",
             "9" : "wxyz"]
        
        func dfs(_ curr: String, _ index: Int) {
            if curr.count == digits.count {
                res.append(curr)
                return
            }
            if let token = dict[digits[digits.index(digits.startIndex, offsetBy: index)]] {
                for char in token {
                    dfs(curr+String(char),index+1)
                }
            }
        }
        dfs("",0)
        return res
    }
}

func letterCombinations(_ digits: String) -> [String] {
    if digits.count == 0 { return [] }
    var res = [String]()
    
    let dict: [Character : String] = 
            ["2" : "abc",
            "3" : "def",
            "4" : "ghi",
            "5" : "jkl",
            "6" : "mno",
            "7" : "pqrs",
            "8" : "tuv",
            "9" : "wxyz"]
    
    let dcount = digits.count
    let aDigits = Array(digits)

    func dfs(_ index: Int,_ list: [Character]) {
        if index == dcount {
            res.append(list.map{String($0)}.joined())
            return
        }
        var list = list
        if let word = dict[aDigits[index]] {
            for c in word {
                list.append(c)
                dfs(index+1,list)
                list.removeLast()
            }
        }
    }

    dfs(0,[])
    return res
}

// O(n!), O(n!)
func letterCombinations(_ digits: String) -> [String] {
    if digits.count == 0 { return [] }
    var res = [String]()
    
    let dict: [Character : String] = 
        ["2" : "abc",
            "3" : "def",
            "4" : "ghi",
            "5" : "jkl",
            "6" : "mno",
            "7" : "pqrs",
            "8" : "tuv",
            "9" : "wxyz"]
    
    let dcount = digits.count
    let aDigits = Array(digits)

    func dfs(_ index: Int,_ curr: String) {
        if index == dcount {
            res.append(curr)
            return
        }
        if let word = dict[aDigits[index]] {
            for c in word {
                dfs(index+1,curr+String(c))
            }
        }
    }
    dfs(0,"")

    return res
}