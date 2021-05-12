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

    func validPalindrome(_ s: String) -> Bool {
        let sArr = Array(s)
        
        var l = 0, r = sArr.endIndex - 1
        while l < r {
            if sArr[l] != sArr[r] {
                var left = l+1, right = r
                var flag = true
                while left < right {
                    if sArr[left] != sArr[right] {
                        flag = false
                        break
                    }
                    left += 1
                    right -= 1
                }
                left = l; right = r-1
                var flag2 = true
                while left < right {
                    if sArr[left] != sArr[right] {
                        flag2 = false
                        break
                    }
                    left += 1
                    right -= 1
                }
                return flag || flag2
            }
            l += 1
            r -= 1
        }
        return true
    }