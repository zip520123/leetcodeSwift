//Reducing Dishes
//O(n^2), O(n)
    func maxSatisfaction(_ satisfaction: [Int]) -> Int {
        let arr = satisfaction.sorted()
        if arr.last! <= 0 {return 0}
        var res = 0
        let n = arr.endIndex
        for i in 0..<n {
            var curr = 0, count = 1
            for j in i..<n {
                curr += count * arr[j]
                count += 1
            }
            res = max(res, curr)
        }
        return res
    }