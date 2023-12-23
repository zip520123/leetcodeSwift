// Maximum Score After Splitting a String
// O(n), O(n)
    func maxScore(_ s: String) -> Int {
        var ones = 0
        for char in s {
            if char == "1" {
                ones += 1
            }
        }
        var res = 0
        var zeros = 0
        let arr = Array(s)
        
        for i in 0..<arr.endIndex-1 {
            if arr[i] == "0" {
                zeros += 1
            }
            if arr[i] == "1" {
                ones -= 1
            }
            res = max(res, zeros+ones)
        }
        return res
    }