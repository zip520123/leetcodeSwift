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