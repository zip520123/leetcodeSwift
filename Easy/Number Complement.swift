//Number Complement O(n) 
//the same as Completent of Base 10 interger without `0` test case
    func findComplement(_ num: Int) -> Int {
        var res = 0
        var mask = 1
        while mask < num {
            res += mask&num == 0 ? mask : 0
            mask *= 2
        }
        return res
    }
