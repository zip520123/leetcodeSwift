// Find the Pivot Integer
// O(n^2), O(1)
func pivotInteger(_ n: Int) -> Int {
    for i in 1...n {
        var curr = 0
        for j in 1...i {
            curr += j
        }
        var end = 0
        for k in i...n {
            end += k
        }
        if curr == end {
            return i
        }
    }
    return -1
}

// O(n), O(n)
func pivotInteger(_ n: Int) -> Int {
    var arr = (0...n).map { num in num }
    for i in 1...n {
        arr[i] = arr[i-1] + i
    }
    for i in 1...n {
        if arr[n] - arr[i] == arr[i-1] {
            return i
        }
    }
    return -1
}