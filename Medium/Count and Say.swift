//Count and Say
    func countAndSay(_ n: Int) -> String {
        var res = "1"
        if n == 1 {return res}
        for i in 2...n {
            let sArr = Array(res)
            res = ""
            var c = sArr[0]
            var count = 0
            for char in sArr {
                if c == char {
                    count += 1
                } else {
                    res += String(count) + String(c)
                    c = char
                    count = 1
                }
            }
            res += String(count) + String(c)
        }
        return res
    }