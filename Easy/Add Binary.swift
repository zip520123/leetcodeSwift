//Add Binary
//O(n)
 func addBinary(_ a: String, _ b: String) -> String {
    var res = ""
    var arr1 = Array(a.reversed()), arr2 = Array(b.reversed())
    var index = 0
    var carry = 0
    while index < arr1.endIndex && index < arr2.endIndex {
        let left = Int(String(arr1[index]))!, right = Int(String(arr2[index]))!
        let curr = left + right + carry
        let digits = curr % 2
        carry = curr / 2
        res += String(digits)
        index += 1
    }
    
    while index < arr1.endIndex {
        let curr = Int(String(arr1[index]))! + carry
        let digits = curr % 2
        carry = curr / 2
        res += String(digits)
        index += 1
    }
    
    while index < arr2.endIndex {
        let curr = Int(String(arr2[index]))! + carry
        let digits = curr % 2
        carry = curr / 2
        res += String(digits)
        index += 1
    }
    
    if carry > 0 {
        res += String(carry)    
    }
    return String(res.reversed())
}

    func addBinary(_ a: String, _ b: String) -> String {
        var aArr = Array(a.reversed()), bArr = Array(b.reversed())
        var carry = 0
        var i = 0
        var res = ""
        while i < aArr.endIndex && i < bArr.endIndex {
            let curr = Int(String(aArr[i]))! + Int(String(bArr[i]))! + carry
            carry = curr >= 2 ? 1 : 0
            
            res.append(String(curr%2))
            i += 1
        }
        while i < aArr.endIndex {
            let curr = Int(String(aArr[i]))! + carry
            carry = curr >= 2 ? 1 : 0
            res.append(String(curr%2))
            i += 1
        }
        while i < bArr.endIndex {
            let curr = Int(String(bArr[i]))! + carry
            carry = curr >= 2 ? 1 : 0
            res.append(String(curr%2))
            i += 1
        }
        if carry == 1 {
            res.append("1")
        }
        return String(res.reversed())
    }

    //crash
    func addBinary(_ a: String, _ b: String) -> String {
        let left = Int(a, radix: 2)!, right = Int(b, radix:2)!    
        let res = String(left+right, radix:2)
        return res
    }