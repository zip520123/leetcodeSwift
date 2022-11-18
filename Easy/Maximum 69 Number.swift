//Maximum 69 Number
//O(n), O(n)
    func maximum69Number (_ num: Int) -> Int {
        var arr = [Int]()
        var n = num
        while n > 0 {
            let curr = n % 10
            n /= 10
            arr.insert(curr, at: 0)
        }
        
        for i in 0..<arr.endIndex {
            if arr[i] == 6 {
                arr[i] = 9
                var res = 0, digit = 1
                for n in arr.reversed() {
                    res += n * digit
                    digit *= 10
                }
                return res
            }
        }
        return num
    }