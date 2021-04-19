//Add Strings
//O(n1+n2) O(n1+n2)
    func addStrings(_ num1: String, _ num2: String) -> String {
        let arr1 = Array(num1.reversed()), arr2 = Array(num2.reversed())
        var carry = 0
        var l = 0, r = 0
        var res = ""
        while l < arr1.endIndex && r < arr2.endIndex {
            let n1 = Int(String(arr1[l]))!
            let n2 = Int(String(arr2[r]))!
            let curr = n1 + n2 + carry
            carry = curr / 10
            let digit = curr % 10
            res += String(digit)
            l += 1
            r += 1
        }
        
        while l < arr1.endIndex {
            let n = Int(String(arr1[l]))!
            let curr = n + carry
            carry = curr / 10
            let digit = curr % 10
            res += String(digit)
            l += 1
        }
        
        while r < arr2.endIndex {
            let n = Int(String(arr2[r]))!
            let curr = n + carry
            carry = curr / 10
            let digit = curr % 10
            res += String(digit)
            r += 1
        }
        
        if carry > 0 {
            res += String(carry)
        }
        
        return String(res.reversed())
    }