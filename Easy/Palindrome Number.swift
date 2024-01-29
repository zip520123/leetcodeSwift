// Palindrome Number
// O(n), O(n)
func isPalindrome(_ x: Int) -> Bool {
    if x < 0 {return false}
    let arr = Array(String(x))
    var l = 0, r = arr.endIndex-1
    while l<r {
        if arr[l] != arr[r] { return false }
        l += 1
        r -= 1
    }
    return true
}

// O(n), O(n)
func isPalindrome(_ x: Int) -> Bool {
    if x < 0 {return false}
    var arr = [Int]()
    var n = x
    while n > 0 {
        arr.append(n % 10)
        n /= 10
    }
    return arr == arr.reversed()
}