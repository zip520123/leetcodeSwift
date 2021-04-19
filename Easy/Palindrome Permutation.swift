//Palindrome Permutation
//O(n) O(n)
    func canPermutePalindrome(_ s: String) -> Bool {
        var dict = [Character:Int]()
        for char in s {
            dict[char, default:0] += 1 
        }
        var hasOdd = false
        for (_,value) in dict {
            if value % 2 == 1 {
                if hasOdd == false {
                    hasOdd = true
                } else {
                    return false
                }
            }
        }
        return true
    }