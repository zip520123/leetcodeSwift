//Strobogrammatic Number III
//O(n!) O(n)
    func strobogrammaticInRange(_ low: String, _ high: String) -> Int {
        var res = 0
        let lowlen = low.count, highlen = high.count
        let highN = Int(high)!, lowN = Int(low)!
        
        func dfs(_ l: Int, _ r: Int, _ path: [Character]) {
            var path = path
            if l > r {
                check(path)
                return 
            }
            if l == r {
                path[l] = "1"
                check(path)
                path[l] = "8"
                check(path)
                path[l] = "0"
                check(path)
                return 
            }
            if l != 0 {
                path[l] = "0"
                path[r] = "0"
                dfs(l+1,r-1,path)
            }
            path[l] = "1"
            path[r] = "1"
            dfs(l+1,r-1,path)
            path[l] = "8"
            path[r] = "8"
            dfs(l+1,r-1,path)
            path[l] = "9"
            path[r] = "6"
            dfs(l+1,r-1,path)
            path[l] = "6"
            path[r] = "9"
            dfs(l+1,r-1,path)
        }
        
        func check(_ path: [Character]) {
            let n = Int(String(path))!
            if n >= lowN && n <= highN { res += 1 }
        }
        
        for i in lowlen...highlen {
            dfs(0,i-1, [Character](repeating:" ", count:i))
        }
        
        return res
    }