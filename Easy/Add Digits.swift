 //Add Digits
 //O(n), O(1)
     func addDigits(_ num: Int) -> Int {
        var res = num
        while res >= 10 {
            var temp = 0
            while res > 0 {
                temp += res%10
                res /= 10
            }
            res = temp
        }
        return res
    }

//O(1),O(1)
    func addDigits(_ num: Int) -> Int {
        if num == 0 {return 0}
        if num % 9 == 0 {return 9}
        return num%9
    }