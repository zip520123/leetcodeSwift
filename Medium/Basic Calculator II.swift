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