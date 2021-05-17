//Divide Two Integers
//O(n) O(1) TLE
func divide(_ dividend: Int, _ divisor: Int) -> Int {
    if dividend == -2147483648 && divisor == -1 {
        return 2147483647
    }
    var dividend = dividend
    var divisor = divisor
    var negative = 0
    if dividend < 0 {
        negative += 1
        dividend = -dividend
    }
    if divisor < 0 {
        negative += 1
        divisor = -divisor
    }
    var res = 0
    while dividend >= divisor {
        dividend -= divisor
        res += 1
    }
    if negative % 2 == 1 {
        res = -res
    }
    return res
}
//O(log n) O(1)
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if dividend == -2147483648 && divisor == -1 {return 2147483647}
        var isNag = 0
        if dividend < 0 { isNag += 1 }
        if divisor < 0 { isNag += 1 }
        
        var res = 0
        var dividend = abs(dividend)
        let divisor = abs(divisor)
        while dividend >= divisor {
            var value = divisor
            var pow = 1
            while value + value <= dividend {
                value += value
                pow += pow
            }
            res += pow
            dividend -= value
        }
        if isNag == 1 {
            res = -res
        }
        return res
    }
//
class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let res = dividend / divisor
        if res < -2147483648 {
            return -2147483648
        }
        if res > 2147483647 {
            return 2147483647
        }
        return res
    }
}