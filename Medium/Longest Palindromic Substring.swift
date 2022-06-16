/*Longest Palindromic Substring*/
//time O(n^2) space O(s)
func longestPalindrome(_ s: String) -> String {
    var i = 0
    var resCount = 0
    var resL = 0
    var resR = 0
    let scount = s.count
    let arrS = Array(s)
    while(i < scount) {
        var left = i, right = i
        while right + 1 < scount && arrS[right + 1] == arrS[left] {
            right += 1
        } 
        while(left - 1 >= 0 && right + 1 < scount && arrS[left - 1] == arrS[right + 1]) {
            left -= 1
            right += 1
        }
        
        if right - left + 1 > resCount {
            resCount = right - left + 1
            resL = left
            resR = right
        }
        i += 1
    }
    let res = arrS[resL...resR].map{String($0)}.joined()
    
    return res
}

//O(n^2), O(n)
    func longestPalindrome(_ s: String) -> String {
        let arr = Array(s)
        var index = 0, len = 0
        for i in 0..<arr.endIndex {
            var l = i, r = i
            while l >= 0 && r < arr.endIndex && arr[l] == arr[r] {
                if r-l+1 > len {
                    index = l
                    len = r-l+1
                }
                l-=1
                r+=1
            }
            l = i
            r = i+1
            while l >= 0 && r < arr.endIndex && arr[l] == arr[r] {
                if r-l+1 > len {
                    index = l
                    len = r-l+1
                }
                l-=1
                r+=1
            }
            
        }
        return String(arr[index..<index+len])
    }

    func longestPalindrome(_ s: String) -> String {
        let sArr = Array(s)
        var length = 0
        var start = 0
        for i in 0..<sArr.endIndex {
            var l = i, r = i + 1
            while r < sArr.endIndex && sArr[l] == sArr[r] {
                r += 1    
            }
            r-=1
            l-=1
            r+=1
            while l >= 0 && r < sArr.endIndex && sArr[l] == sArr[r] {
                l-=1
                r+=1
            }
            l+=1
            r-=1

            if r - l + 1 > length {
                length = r - l + 1
                start = l
            }
        }
        return String(sArr[start..<start+length])
    }