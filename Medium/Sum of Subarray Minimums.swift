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