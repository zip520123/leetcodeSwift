//Basic Calculator
//O(n), O(n)
    func calculate(_ s: String) -> Int {
        var curr = 0, n = 0
        var sign: Character = "+"
        let sArr = Array(s)
        var i = 0
        var stack = [(curr:Int, sign:Character)]()
        while i < sArr.endIndex {
            let char = sArr[i]
            switch char {
                case "(":
                    stack.append((curr,sign))
                    curr = 0; n = 0; sign = "+"
                case ")":
                    let prev = stack.removeLast()
                    if sign == "+" {
                        curr += n
                    } else {
                        curr -= n
                    }

                    if prev.sign == "+" {
                        curr = prev.curr + curr
                    } else {
                        curr = prev.curr - curr
                    }
                    n = 0; sign = "+"
                case "+", "-":
                    if sign == "+" {
                        curr += n
                    } else {
                        curr -= n
                    }
                    n = 0; sign = char
                
                case "0"..."9":
                    n = n*10 + Int(String(char))!
                
                default:
                    break
            }
            i += 1
        }
        if sign == "+" {
            curr += n
        } else {
            curr -= n
        }
        return curr 
    }

    //short version
        func calculate(_ s: String) -> Int {
        var curr = 0, n = 0
        var sign: Character = "+"
        let sArr = Array(s)
        var i = 0
        var stack = [(curr:Int, sign:Character)]()
        while i < sArr.endIndex {
            let char = sArr[i]
            switch char {
                case "(":
                    stack.append((curr,sign))
                    curr = 0; n = 0; sign = "+"
                case ")":
                    let prev = stack.removeLast()
                    curr = sign == "+" ? curr + n : curr - n
                    curr = prev.sign == "+" ? prev.curr + curr : prev.curr - curr
                    
                    n = 0; sign = "+"
                case "+", "-":
                    curr = sign == "+" ? curr + n : curr - n
                    n = 0; sign = char
                
                case "0"..."9":
                    n = n*10 + Int(String(char))!
                
                default:
                    break
            }
            i += 1
        }
        curr = sign == "+" ? curr + n : curr - n
        return curr 
    }

    //O(n),O(1)
    func calculate(_ s: String) -> Int {
        var res = 0, curr = 0
        var sign: Character = "+"
        var stack: [(res: Int, sign: Character)] = []
        for char in s {
            switch char {
                case "(":
                    stack.append((res, sign))
                    sign = "+"; res = 0; curr = 0
                case ")":
                    let last = stack.removeLast()
                    res = sign == "+" ? res + curr : res - curr
                    res = last.sign == "+" ? last.res + res : last.res - res
                    curr = 0; sign = "+"
                case "+", "-":
                    res = sign == "+" ? res + curr : res - curr
                    sign = char; curr = 0
                case "0"..."9":
                    curr = curr*10 + Int(String(char))!
                default:
                    break
            }
        }
        return sign == "+" ? res + curr : res - curr
    }