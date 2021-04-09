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

    func longestPalindrome(_ s: String) -> String {
        var sArr = Array(s)

        func findCenter(_ index: Int) -> [Int] {
            var left = index
            var right = index
            while right < sArr.endIndex && sArr[left] == sArr[right] {
                right += 1
            }
            right -= 1
            return [left, right]
        }
        
        func expend(_ point:[Int]) -> [Int] {
            var left = point[0]
            var right = point[1]
            while left >= 0 && right < sArr.endIndex && sArr[left] == sArr[right] {
                left-=1
                right+=1 
            }
            return [left + 1, right - 1]
        }
        
        var index = 0
        var count = 0
        var res = ""
        while index < sArr.endIndex {
            let center = findCenter(index)
            let edges = expend(center)
            count = max(count, edges[1] - edges[0] + 1)
            if edges[1] - edges[0] + 1 >= count {
                res = (sArr[edges[0]...edges[1]]).map{String($0)}.joined()
            }
            index+=1
        }
        
        return res
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