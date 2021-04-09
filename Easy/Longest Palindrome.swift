//Longest Palindrome
    func longestPalindrome(_ s: String) -> Int {
        var dict = [Character:Int]()
        for char in s {
            dict[char, default:0]+=1
        }
        var res = 0
        var single = 0
        for (_,value) in dict {
            res += value / 2 * 2
            if res % 2 == 0 && value % 2 == 1 {
                res += 1
            }
        }
        return res
    }