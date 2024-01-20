//Sum of Subarray Minimums
//O(n), O(n)
    func sumSubarrayMins(_ arr: [Int]) -> Int {
        let mod = Int(1E9+7)
        var stack = [Int](), sums = arr.map{_ in 0}
        for (i, n) in arr.enumerated() {
            while !stack.isEmpty && arr[stack.last!] > n {
                stack.removeLast()
            }
            let j = stack.isEmpty ? -1: stack.last!
            if j == -1 {
                sums[i] = sums.last! + (i-j)*n
            } else {
                sums[i] = sums[j] + (i-j)*n
            }
            
            stack.append(i)
        }
        return sums.reduce(0,+) % mod
    }

// O(n), O(n)
func sumSubarrayMins(_ arr: [Int]) -> Int {
    let arr = [-Int.max] + arr + [-Int.max]
    var stack = [Int]()
    var res = 0
    let mod = Int(1E9+7)
    for i in 0..<arr.endIndex {
        let curr = arr[i]
        while !stack.isEmpty && arr[stack.last!] > curr {
            let last = stack.removeLast()
            res += arr[last] * (last-stack.last!) * (i-last) % mod
        }
        stack.append(i)
    }
    return res % mod
}