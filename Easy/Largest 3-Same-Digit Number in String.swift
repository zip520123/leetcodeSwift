// Largest 3-Same-Digit Number in String
// O(n), O(n)
func largestGoodInteger(_ num: String) -> String {
    var res = ""
    var curr = -1
    let arr = Array(num)
    for i in 1..<arr.endIndex-1 {
        if arr[i-1] == arr[i] && arr[i] == arr[i+1] {
            let n = Int(String(arr[(i-1)...(i+1)]))!
            if n > curr {
                curr = n
                res = String(arr[(i-1)...(i+1)])
            }
        }
    }
    return res
}