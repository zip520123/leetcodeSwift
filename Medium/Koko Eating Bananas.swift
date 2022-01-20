//Koko Eating Bananas
//O(n log n), O(1)
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var l = 1, r = piles.max() ?? piles.endIndex
        while l < r {
            let mid = l+(r-l)>>1
            var count = 0
            for p in piles {
                let n = Int(ceil(Double(p)/Double(mid)))
                count += n
            }
            if count <= h {
                r = mid
            } else {
                l = mid+1
            }
        }
        return l
    }