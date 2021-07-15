//Custom Sort String
//O(order*str), O(str)
    func customSortString(_ order: String, _ str: String) -> String {
        var res = "", sArr = Array(str)
        
        for char in order {
            for i in 0..<sArr.endIndex {
                if sArr[i] == char {
                    res += String(char)
                    sArr[i] = "."
                }
            }    
        }
        for char in sArr {
            if char != "." {
                res += String(char)
            }
        }
        return res
    }
//O(str), O(str)
    func customSortString(_ order: String, _ str: String) -> String {
        var res = "", sArr = Array(str)
        var dict = [Character: Int]()
        for char in sArr {
            dict[char, default:0] += 1
        }
        
        for char in order {
            if dict[char, default:0] > 0 {
                res += String((0..<dict[char]!).map{_ in char})
                dict[char] = nil
            }
        }
        for (char, value) in dict {
            if dict[char, default:0] > 0 {
                res += String((0..<dict[char]!).map{_ in char})
                dict[char]! = 0
            }
        }
        return res
    }