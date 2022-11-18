//Contains Duplicate II
//O(n), O(n)
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dict = [Int: Int]()
        for (index, n) in nums.enumerated() {
            if let i = dict[n] {
                if abs(i-index) <= k {return true}
            }
            dict[n] = index
        }
        return false
    }