/*Palindromic Substrings*/
func countSubstrings(_ s: String) -> Int {
    
    let sArr = Array(s)
    var i = 0
    var res = 0
    
    func center(_ index: Int) -> [Int] {
        var left = index
        var right = index
        while right < sArr.endIndex && sArr[left] == sArr[right] {
            res += 1
            right += 1
        }
        
        return [index, right - 1]
    } 
    
    func extend(_ left:Int, _ right: Int) -> [Int] {
        var left = left - 1
        var right = right + 1
        while left >= 0 && right < sArr.endIndex && sArr[left] == sArr[right] {
            res += 1
            left -= 1
            right += 1
        }
        return [left+1, right-1]
    }
    
    while i < sArr.endIndex {
        let point = center(i)
        let edge = extend(point[0],point[1])
        i += 1
    }
    
    return res
}