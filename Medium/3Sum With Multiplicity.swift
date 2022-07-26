//3Sum With Multiplicity
//O(n^2), O(1)
    func threeSumMulti(_ arr: [Int], _ target: Int) -> Int {
        let mod = Int(1E9+7)
        var res = 0
        let arr = arr.sorted()
        
        for (i, x) in arr.enumerated() {
            let t = target - x
            var j = i+1, k = arr.endIndex-1
            while j<k {
                if arr[j] + arr[k] < t {
                    j += 1
                } else if arr[j] + arr[k] > t {
                    k -= 1
                } else if arr[j] != arr[k] {
                    var left = 1, right = 1
                    while j+1 < k && arr[j] == arr[j+1]{
                        left += 1
                        j += 1
                    }
                    while k-1>j && arr[k] == arr[k-1] {
                        right += 1
                        k -= 1
                    }
                    res += left * right
                    res %= mod
                    j += 1
                    k -= 1
                } else {
                    res += (k-j+1) * (k-j) / 2
                    res %= mod
                    break
                }
            }
        }
        return res
    }