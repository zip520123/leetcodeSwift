//  Largest Odd Number in String
// O(n), O(1)
func largestOddNumber(_ num: String) -> String {
    var res = ""
    let arr = Array(num)
    for i in (0..<arr.endIndex).reversed() {
        if Int(String(arr[i]))! % 2 == 1 {
            res = String(arr[0...i])
            break
        }
    } 
    return res
}