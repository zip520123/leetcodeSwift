//Valid Palindrome II
    func validPalindrome(_ s: String) -> Bool {
        let sArr = Array(s)
        var i = 0, j = sArr.endIndex - 1
        while i < j {
            if sArr[i] != sArr[j] {
                var i1 = i + 1, j1 = j, i2 = i, j2 = j - 1
                while i1 < j1 && sArr[i1] == sArr[j1] {i1 += 1; j1 -= 1}
                while i2 < j2 && sArr[i2] == sArr[j2] {i2 += 1; j2 -= 1}
                return i1 >= j1 || i2 >= j2
            }
            i += 1
            j -= 1
        }
        return true
    }