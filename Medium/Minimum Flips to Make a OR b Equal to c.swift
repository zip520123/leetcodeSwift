//Minimum Flips to Make a OR b Equal to c
// O(n), O(n)
    func minFlips(_ a: Int, _ b: Int, _ c: Int) -> Int {
        var res = 0
        var a = a, b = b, c = c
        while a > 0 || b > 0 || c > 0 {
            res += check(a&1,b&1,c&1)
            a = a >> 1
            b = b >> 1
            c = c >> 1
        }
        return res

    }
    func check(_ l: Int, _ r: Int, _ c: Int) -> Int {
        if c == 1 {
            if l == 0 && r == 0 {
                return 1
            }
        }
        if c == 0 {
            return l+r
        }
        return 0
    }