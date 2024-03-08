// Minimum Length of String After Deleting Similar Ends
// O(n), O(n)
func minimumLength(_ s: String) -> Int {
    let arr = Array(s)
    var l = 0, r = arr.endIndex-1
    var res = arr.endIndex
    while l<r && arr[l] == arr[r] {
        
        while l+1<r && arr[l+1] == arr[r] {
            l += 1
        }
        while l<r-1 && arr[r-1] == arr[l] {
            r -= 1
        }
        
        l += 1
        r -= 1
        res = min(res, r-l+1)
    }
    return res
}