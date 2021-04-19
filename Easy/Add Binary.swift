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