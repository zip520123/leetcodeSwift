//Bitwise AND of Numbers Range
//O(1), O(1)
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        var i = 0, l = left, r = right
        while l != r {
            l >>= 1
            r >>= 1
            i += 1
        }
        return l << i
        
    }

// O(1), O(1)
func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
    var res = 0
    for i in 0..<32 {
        if right-left < Int(pow(Double(2),Double(i))) && 
        left & Int(pow(Double(2),Double(i))) != 0 && 
        right & Int(pow(Double(2),Double(i))) != 0 {
            res += Int(pow(Double(2),Double(i)))
        }
    }
    return res
}