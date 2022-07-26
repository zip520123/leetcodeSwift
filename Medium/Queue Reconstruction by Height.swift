//Queue Reconstruction by Height
//O(n^2), O(n)
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        let arr = people.sorted { a,b in
            if a[0] == b[0] {
                return a[1] < b[1]
            } 
            return a[0] > b[0]
        }
        
        var res = [[Int]]()
        for item in arr {
            if res.count < item[1] {
                res.append(item)
            } else {
                res.insert(item, at: item[1])
            }
            
        }
        return res
    }