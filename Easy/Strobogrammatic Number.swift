//Strobogrammatic Number
//O(n) O(n)
    func isStrobogrammatic(_ num: String) -> Bool {
        var map:[Character:Character] = ["1":"1","6":"9","8":"8","9":"6","0":"0"]
        var stro = ""
        let sArr = Array(num)
        for char in sArr {
            if let stroChar = map[char] {
                stro = String(stroChar) + stro
            } else {
                return false
            }
        }
        return stro == num
    }

//O(n) O(1)
    func isStrobogrammatic(_ num: String) -> Bool {
        var map:[Character:Character] = ["1":"1","6":"9","8":"8","9":"6","0":"0"]
        
        let sArr = Array(num)
        var l = 0, r = sArr.endIndex - 1
        while l <= r {
            if let stro = map[sArr[l]], stro == sArr[r] {
                
            } else {
                return false
            }
            
            l += 1
            r -= 1
        }
        return true
    }
    
//O(n) O(n)
    func isStrobogrammatic(_ num: String) -> Bool {
        var map:[Character:Character] = ["1":"1","6":"9","8":"8","9":"6","0":"0"]
        
        return num == String(num.compactMap { map[$0] }.reversed())
    }