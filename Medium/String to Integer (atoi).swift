//String to Integer (atoi)
func myAtoi(_ s: String) -> Int {
    let sArr = Array(s)
    var hasSign = false
    var value = 0
    var hasNum = false
    var isNegative = false
    var i = 0
    while i < sArr.endIndex && sArr[i] == " "{
        i += 1
    }
    while i < sArr.endIndex {
        if sArr[i] == "+" || sArr[i] == "-" {
            if hasSign || hasNum {
                break
            }
            hasSign = true
            if sArr[i] == "-" {
                isNegative = true
            }
        } else if let n = Int(String(sArr[i])) {
            value = value * 10 + n
            hasNum = true
            if value >= Int(Int32.max) {
                break
            }
        } else {
            break
        }
        i += 1
    }
    
    if isNegative {
        value = -value
    }
    if value > Int(Int32.max) {
        value = Int(Int32.max)
    }
    if value < Int(Int32.min) {
        value = Int(Int32.min)
    }
    return value
}
//O(n), O(1)
    func myAtoi(_ s: String) -> Int {
        var res = 0
        var negative = false
        var i = 0
        let arr = Array(s)
        while i<s.count, arr[i] == " " {
            i += 1
        }
        if i<s.count, arr[i] == "+" || arr[i] == "-" {
            if arr[i] == "-" {negative = true}
            i += 1    
        }
        while i<s.count, let n = Int(String(arr[i])) {
            res = res * 10 + n
            if res >= Int(Int32.max) {
                break
            }
            i += 1
        }
        res = negative ? -res : res
        res = res > Int(Int32.max) ? Int(Int32.max) : res
        res = res < Int(Int32.min) ? Int(Int32.min) : res
        return res
    }
    
//DFA
//O(n), O(1)
    enum Action {
        case space, sign, num
    }
    func myAtoi(_ s: String) -> Int {
        let dfa: [[Action:Int]] = [
            [.space: 0, .sign:1, .num: 2],
            [.num: 2],
            [.num: 2]
        ]
        
        var res = 0
        var state = 0
        var negative = false
        loop: for char in s {
            switch char {
                case " ": //space
                    if let next = dfa[state][.space] {
                        state = next
                    } else {
                        break loop
                    }
                case "0"..."9": //num
                    if let next = dfa[state][.num] {
                        let n = Int(String(char))!
                        res = res*10 + n
                        state = next
                        if res >= Int(Int32.max) {
                            break loop
                        }
                    } else {
                        break loop
                    }
                case "+", "-": //sign
                    if let next = dfa[state][.sign] {
                        if char == "-" {
                            negative = true
                        }
                        state = next
                    } else {
                        break loop
                    }
                default:
                    break loop
            }
        }
        res = negative ? -res : res
        res = res > Int(Int32.max) ? Int(Int32.max) : res
        res = res < Int(Int32.min) ? Int(Int32.min) : res
        return res
    }

