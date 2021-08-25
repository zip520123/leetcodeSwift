//Sum of Square Numbers
//O(√c), O(√c)
    func judgeSquareSum(_ c: Int) -> Bool {
        var dict = [Int: Bool]()
        var i = 0
        while i*i <= c {
            dict[i*i] = true
            i += 1
        }
        i -= 1
        while i >= 0 {
            if dict[c-i*i,default: false] == true {
                return true
            }
            i -= 1
        }
        return false
    }
    
    func judgeSquareSum(_ c: Int) -> Bool {
        var dict = [Int: Bool]()
        var a = 0
        while a*a <= c {
            dict[a*a] = true
            a += 1
        }
        for (key,_) in dict {
            if dict[c - key, default: false] == true {
                return true
            }
        }
        return false
    }
//O(√c log c), O(1)
    func judgeSquareSum(_ c: Int) -> Bool {
        var a = 0
        while a*a <= c {
            let b = sqrt(Double(c)-Double(a*a))
            if b == Double(Int(b)) {return true}
            a += 1
        }
        return false
    }