//Valid Number
class Solution {
    func isNumber(_ s: String) -> Bool {
        var eIndex: Int?
        for (i,char) in s.enumerated() {
            if char == "e" || char == "E" {
                if eIndex == nil {
                    eIndex = i    
                } else {
                    return false
                }
            }
        }
        let sArr = Array(s)
        if eIndex != nil {
            let left = String(sArr[0..<eIndex!])
            let right = String(sArr[eIndex!+1..<sArr.endIndex])
            if isDecimal(left) && validateNumber(right) {
                return true
            } else {
                return false
            }
        }
        return isDecimal(s) || validateNumber(s)
    }
    
    func isDecimal(_ s: String) -> Bool {
        let sArr = Array(s)
        var i = 0
        var hasSign = false
        var hasDot = false
        var hasNum = false
        while i < sArr.endIndex {
            let char = sArr[i]
            if char == "+" || char == "-" {
                if hasSign || hasDot || hasNum {
                    return false
                }
                hasSign = true
            } else if char == "." {
                if hasDot {
                    return false
                } 
                hasDot = true
            } else if Int(String(char)) != nil {
                hasNum = true 
            } else {
                return false
            } 
            i += 1
        }
        return hasValue
    }
    
    func validateNumber(_ s: String) -> Bool {
        let sArr = Array(s)
        var i = 0
        var hasNum = false
        var hasSign = false
        while i < sArr.endIndex {
            let char = sArr[i]
            if char == "-" || char == "+" {
                if hasSign || hasNum {
                    return false
                }
                hasSign = true
            } else if let n = Int(String(char)) {
                hasNum = true
            } else {
                return false
            }
            i += 1
        }
        return hasNum
    }
}