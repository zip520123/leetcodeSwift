//Remove Stones to Minimize the Total
//O(n*k), O(n) TLE
    func minStoneSum(_ piles: [Int], _ k: Int) -> Int {
        var arr = piles.sorted() //O(n log n)
        for _ in 0..<k {
            let last = Double(arr.removeLast())
            let curr = Int(round(last/2.0))
            var l = 0, r = arr.endIndex
            while l<r {
                let mid = l+(r-l)>>1
                if arr[mid] < curr {
                    l = mid+1
                } else {
                    r = mid
                }
            }
            arr.insert(curr, at: l) //O(n)
        }
        return arr.reduce(0,+)
    }