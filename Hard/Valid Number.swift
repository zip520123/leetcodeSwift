//Valid Number
class Solution {
    func isNumber(_ s: String) -> Bool {
        var arr = Array(s.lowercased())
        var eIndex :Int?
        for i in 0..<arr.endIndex {
            if arr[i] == "e" {
                eIndex = i
            }
        }
        if eIndex != nil {
            let left = String(arr[0..<eIndex!])
            let right = String(arr[(eIndex!+1)...])
            return decimal(left) && integer(right)
        } 
        return decimal(s) || integer(s)
    }
    
    func decimal(_ s: String) -> Bool {
        var seenDigit = false
        var seenDot = false
        var seenSign = false
        for char in s {
            if char == "+" || char == "-" {
                if seenSign || seenDigit || seenDot {return false}
                seenSign = true
            } else if char == "." {
                if seenDot {return false}
                seenDot = true
            } else {
                if let n = Int(String(char)) {
                    seenDigit = true
                } else {
                    return false
                }
            }
        }
        return seenDigit
    }
    
    func integer(_ s: String) -> Bool {
        var seenSign = false
        var seenDigit = false
        for char in s {
            if char == "+" || char == "-" {
                if seenSign || seenDigit {return false}
                seenSign = true
            } else {
                if Int(String(char)) == nil {
                    return false
                }
                seenDigit = true
            }
        }
        return seenDigit
    }
    
}

//Deterministic Finite Automaton (DFA)
enum ValidSymbol {
    case space  // ' '
    case sign   // +-
    case dot    // .
    case exp    // e
    case digit  // 0-9
}

let state: [[ValidSymbol: Int]] = [
    [.space: 0, .sign: 1, .digit: 2, .dot: 3],
    [.digit: 2, .dot: 3],
    [.digit: 2, .dot: 4, .exp: 5, .space: 8],
    [.digit: 4],
    [.digit: 4, .exp: 5, .space: 8],
    [.sign: 6, .digit: 7],
    [.digit: 7],
    [.digit: 7, .space: 8],
    [.space: 8]
]

func isNumber(_ str: String) -> Bool {
    var stateCounter = 0
    for c in str {
        var symb: ValidSymbol
        switch c {
        case "0"..."9":
            symb = .digit
        case "+", "-":
            symb = .sign
        case "e":
            symb = .exp
        case ".":
            symb = .dot
        case " ":
            symb = .space
        default:
            return false
        }
        if let nextState = state[stateCounter][symb] {
            stateCounter = nextState
        } else {
            return false
        }
    }
    switch stateCounter {
    case 2, 4, 7, 8:
        return true
    default:
        return false
    }
}

class Solution {
    enum Symbol {
        case sign
        case dot
        case exp
        case digit
    }
    let statusArr: [[Symbol: Int]] = [
    [.sign: 2, .digit: 1, .dot: 3],
    [.digit: 1, .dot: 4, .exp: 5],
    [.digit: 1, .dot: 3],
    [.digit: 4],
    [.digit: 4, .exp: 5],
    [.sign: 6, .digit:7],
    [.digit: 7],
    [.digit: 7]]
    
    func isNumber(_ s: String) -> Bool {
        var currStatus = 0
        for char in s {
            var symbol: Symbol
            switch char {
                case "0"..."9":
                    symbol = .digit
                case "+", "-":
                    symbol = .sign
                case "e", "E":
                    symbol = .exp
                case ".":
                    symbol = .dot
                default:
                    return false
            }
            if let nextStatus = statusArr[currStatus][symbol] {
                currStatus = nextStatus
            } else {
                return false
            }
        }
        switch currStatus {
            case 1,4,7:
                return true
            default:
                return false
        }
    }
    
}