// Maximum Swap
// O(n^2), O(n)
func maximumSwap(_ num: Int) -> Int {
    var arr = [Int]()
    var n = num
    while n > 0 {
        arr.append(n%10)
        n /= 10
    }
    arr.reverse()
    for i in 0..<arr.endIndex-1 {
        var candidate = arr[i]
        var candidate_index = i
        for j in (i+1..<arr.endIndex).reversed() {
            if arr[j] > candidate {
                candidate = arr[j]
                candidate_index = j
            }
        }
        if candidate_index != i {
            (arr[i], arr[candidate_index]) = (arr[candidate_index], arr[i])
            var res = 0
            for n in arr {
                res *= 10
                res += n
            }
            return res
        }
    }
    return num
}

// O(n), O(n)
func maximumSwap(_ num: Int) -> Int {
    var arr = [Int]()
    var n = num
    while n > 0 {
        arr.append(n%10)
        n /= 10
    }
    arr.reverse()

    var dp = [Int](repeating: 0, count: arr.endIndex)
    var dp_index = [Int](repeating: 0, count: arr.endIndex)
    dp[arr.endIndex-1] = arr[arr.endIndex-1]
    dp_index[arr.endIndex-1] = arr.endIndex-1

    for i in (0..<arr.endIndex-1).reversed() {
        if dp[i+1] < arr[i] {
            dp[i] = arr[i]
            dp_index[i] = i
        } else {
            dp[i] = dp[i+1]
            dp_index[i] = dp_index[i+1]
        }
    }

    for i in 0..<arr.endIndex {
        if arr[i] < dp[i] {
            (arr[i], arr[dp_index[i]]) = (arr[dp_index[i]], arr[i])
            var res = 0
            for n in arr {
                res *= 10
                res += n
            }
            return res
        }
    }
    return num
}