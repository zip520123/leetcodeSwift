//Out of Boundary Paths
//O(mnM), O(mnM)
    func findPaths(_ m: Int, _ n: Int, _ maxMove: Int, _ startRow: Int, _ startColumn: Int) -> Int {
        let mod = Int(1E9 + 7)
        let direction = [0,1,0,-1,0]
        var dict = [[Int]: Int]()
        func dfs(_ x: Int, _ y:Int, _ curr: Int) -> Int {
            if dict[[x,y,curr]] != nil {
                return dict[[x,y,curr]]! % mod
            }
            var res = 0
            if x < 0 || x == m || y < 0 || y == n {
                res += 1; return res
            }
            if curr == maxMove {return res}
            for k in 0..<4 {
                let dx = x+direction[k], dy = y+direction[k+1]
                res += (dfs(dx,dy,curr+1)) 
            }
            dict[[x,y,curr]] = res
            return res % mod
        }

        return dfs(startRow, startColumn, 0) 
    }

//O(m*n*maxMove), O(m*n*maxMove)
    func findPaths(_ m: Int, _ n: Int, _ maxMove: Int, _ startRow: Int, _ startColumn: Int) -> Int {
        let rows = m, cols = n
        var dict = [[Int]: Int]()
        
        func dfs(_ x: Int, _ y: Int, _ path: Int) -> Int {
            if dict[[x,y,path]] != nil {
                return dict[[x,y,path]]!
            }
            var res = 0
            if x<0 || y<0 || x>=rows || y >= cols {
                res += 1
                return res
            }
            
            if path == maxMove {
                return res
            }
            
            res += dfs(x+1,y,path+1)
            res += dfs(x,y+1,path+1)
            res += dfs(x-1,y,path+1)
            res += dfs(x,y-1,path+1)
            dict[[x,y,path]] = res % (Int(1E9) + 7)
            return res % (Int(1E9) + 7)
        }
        
        return dfs(startRow, startColumn, 0)
    }