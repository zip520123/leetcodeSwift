//The K Weakest Rows in a Matrix
//O(row log col), O(n)
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        var res = [Int]()
        var valueToIndex = [Int: [Int]]()
        for (i,row) in mat.enumerated() {
            var l = 0, r = row.endIndex-1 
            while l<r {
                let mid = l+(r-l)>>1
                if row[mid] == 1 {
                    l = mid+1
                } else {
                    r = mid
                }
            }
            if row[l] == 1 {
                valueToIndex[l+1, default:[]].append(i)    
            } else {
                valueToIndex[l, default:[]].append(i)
            }
        }
        let sortedValue = valueToIndex.keys.sorted()
        for val in sortedValue {
            for index in valueToIndex[val, default: []] {
                res.append(index)
                if res.endIndex == k {return res}
            }
        }
        return res
    }