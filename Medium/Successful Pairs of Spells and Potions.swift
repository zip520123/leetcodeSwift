//Successful Pairs of Spells and Potions
//O(s * p log p), O(p)
    func successfulPairs(_ spells: [Int], _ potions: [Int], _ success: Int) -> [Int] {
        var res = [Int]()
        let arr = potions.sorted()
        for s in spells {
            var l = 0, r = arr.endIndex
            while l<r {
                let mid = l+(r-l)>>1
                if arr[mid] * s < success {
                    l = mid+1
                } else {
                    r = mid
                }
            }
            let curr = arr.endIndex-l
            res.append(curr)
        }
        return res
    }