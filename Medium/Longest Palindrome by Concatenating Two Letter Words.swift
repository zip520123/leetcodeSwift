//Longest Palindrome by Concatenating Two Letter Words
//O(n), O(n)
    func longestPalindrome(_ words: [String]) -> Int {
        var res = 0
        var dict = [String: Int]()
        
        for word in words {
            dict[word, default:0] += 1
        }
        
        var central = false
        for word in dict.keys {
            let arr = Array(word)
            if arr[0] == arr[1] {
                if dict[word]! % 2 == 0 {
                    res += dict[word]!
                } else {
                    res += dict[word]! - 1
                    central = true
                }    
            } else if arr[0] < arr[1] {
                let reversedWord = String(word.reversed())
                res += 2 * min(dict[word]!, dict[reversedWord, default: 0])
            }
            
        }
        if central {
            res += 1
        }
        return 2*res
    }