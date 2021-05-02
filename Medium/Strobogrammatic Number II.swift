//Strobogrammatic Number II
class Solution {
    func findStrobogrammatic(_ n: Int) -> [String] {
        var res = [String]()
        
        func dfs(_ l:Int, _ r:Int, _ path:[Character]) {
            var path = path
            if l > r {
                res.append(String(path))
                return
            }
            if l == r {
                path[l] = "0"
                res.append(String(path))
                path[l] = "1"
                res.append(String(path))
                path[l] = "8"
                res.append(String(path))
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
            path[l] = "6"
            path[r] = "9"
            dfs(l+1,r-1,path)
            path[l] = "9"
            path[r] = "6"
            dfs(l+1,r-1,path)
            path[l] = "8"
            path[r] = "8"
            dfs(l+1,r-1,path)
        }
        
        dfs(0,n-1, [Character](repeating:" ",count:n))
        return res
    }
}