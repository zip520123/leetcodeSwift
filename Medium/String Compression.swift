//String Compression
//O(n), O(1)
    func compress(_ chars: inout [Character]) -> Int {
        let n = chars.endIndex
        if n == 1 {return 1}
        var i = 0, j = 0
        while i<n {
            var count = 1
            while i<n-1 && chars[i] == chars[i+1] {
                count += 1
                i += 1
            }
            chars[j] = chars[i]
            i += 1; j += 1
            if count > 1 {
                let str = String(count)
                for char in str {
                    chars[j] = char
                    j += 1
                }
            }
        }
        return j
    }