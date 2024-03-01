// Maximum Odd Binary Number
// O(n), O(n)
func maximumOddBinaryNumber(_ s: String) -> String {
    var arr = Array(s)
    var r = arr.endIndex-1
    var l = 0
    while l < r {
        if arr[l] == "1" {
            (arr[l], arr[r]) = (arr[r], arr[l])
            break
        }
        l += 1
    }
    l = 0
    r = 0
    while r < arr.endIndex-1 {
        if arr[r] == "1" {
            (arr[l], arr[r]) = (arr[r], arr[l])
            l += 1
        }
        r += 1
    }
    return String(arr)
}