//Basic Calculator II
    func calculate(_ s: String) -> Int {
        let s = s + "+"
        var num = 0, sign: Character = "+", sum = 0, lastVal = 0
        
        for char in s {
            if char == " " {
                continue
            }
            if let n = Int(String(char)) {
                num = num * 10 + n
            } else {
                switch sign {
                    case "+":
                        sum += lastVal
                        lastVal = num
                    case "-":
                        sum += lastVal
                        lastVal = -num
                    case "*":
                        lastVal *= num
                    case "/":
                        lastVal /= num
                    default:
                        break
                }
                
                num = 0
                sign = char
            }
            
        }
        
        return sum + lastVal
    }

//O(n),O(1)
    func calculate(_ s: String) -> Int {
        var s = s + "++"
        var curr = 0, last = 0, sum = 0, sign: Character = "+"
        
        for char in s {
            if char == " " {continue}
            if let n = Int(String(char)) {
                curr = curr*10 + n
            } else {
                switch sign {
                    case "+":
                        sum += last
                        last = curr
                    case "-":
                        sum += last
                        last = -curr
                    case "*":
                        last *= curr
                    case "/":
                        last /= curr
                    default:
                        break
                }
                curr = 0
                sign = char
            }
        }
        return sum
    }