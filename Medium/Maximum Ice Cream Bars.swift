//Maximum Ice Cream Bars
//O(n log n), O(n)
    func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
        var res = 0
        let arr = costs.sorted()
        var curr = coins 
        for i in 0..<arr.endIndex {
            if curr >= arr[i] {
                res += 1
                curr -= arr[i]
            }
        }
        return res
    }