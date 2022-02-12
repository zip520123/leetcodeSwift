//Detect Capital
//O(n), O(n)
class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        return case1(word) || case2(word) || case3(word)
    }
    
    func case1(_ word: String) -> Bool {
        for char in word {
            switch char {
                case "A"..."Z":
                    break
                default:
                    return false
            }
        }
        return true
    }
    
    func case2(_ word: String) -> Bool {
        for char in word {
            switch char {
                case "a"..."z":
                    break
                default:
                    return false
            }
        }
        return true
    }
    
    func case3(_ word: String) -> Bool {
        let arr = Array(word)
        return case1(String(arr[0])) && case2(String(arr[1...]))
    }
}