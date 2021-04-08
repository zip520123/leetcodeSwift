//Generate Parentheses
func generateParenthesis(_ n: Int) -> [String] {
        var res = [String]()
        func dfs(_ path:String, _ left: Int, _ right: Int) {
            if path.count == n * 2 {
                res.append(path)
                return
            }
            if left < n {dfs(path+"(",left+1,right)}
            if right < left {dfs(path+")",left,right+1)}
            
        }
        dfs("", 0,0)
        return res
    }