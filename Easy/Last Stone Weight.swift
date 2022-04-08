//Last Stone Weight
//O(n^2), O(n)
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var arr = stones.sorted()
        while arr.endIndex > 1 {
            let a = arr.removeLast()
            let b = arr.removeLast()
            let n = abs(a-b)
            var l = 0, r = arr.endIndex
            while l<r {
                let mid = l+(r-l)>>1
                if arr[mid] < n {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            arr.insert(n, at: l)
        }
        
        if arr.endIndex == 0 {return 0}
        return arr[0]
    }