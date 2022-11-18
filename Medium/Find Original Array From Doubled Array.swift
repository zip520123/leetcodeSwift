//Find Original Array From Doubled Array
//O(n log n), O(n)
    func findOriginalArray(_ changed: [Int]) -> [Int] {
        if changed.endIndex % 2 != 0 {return []}
        let arr = changed.sorted()
        var res = [Int](), dict = [Int: Int]()
        for n in changed {
            dict[n, default: 0] += 1
        }
        if dict[0, default: 0] > 0 && dict[0]! % 2 == 0 {
            for i in 0..<(dict[0]!/2) {
                res.append(0)
            }
            dict[0] = 0
        }
        
        for i in 0..<arr.endIndex {
            let n = arr[i]
            if n == 0 {continue}
            if dict[n, default: 0] > 0 && dict[n*2, default: 0] > 0 {
                res.append(n)
                dict[n*2]! -= 1
                dict[n]! -= 1
            } 
        }
        
        for (key, val) in dict {
            if val != 0 {return []}
        }

        return res
    }