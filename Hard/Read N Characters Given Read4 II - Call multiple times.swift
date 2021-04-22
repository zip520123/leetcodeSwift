//Read N Characters Given Read4 II - Call multiple times
class Solution : Reader4 {
    var curr = [Character](repeating: Character(" "), count: 4)
    var index = 0
    var count = 0
    func read(_ buf: inout [Character], _ n: Int) -> Int {
        
        var res = 0
        for i in 0..<n {
            if count == 0 {
                count = read4(&curr)  
                index = 0
            }
            if count > 0 {
                buf[i] = curr[index]
                index += 1
                count -= 1    
                res += 1
            }
        }
        return res
    }

}