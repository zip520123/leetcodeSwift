/*Pacific Atlantic Water Flow*/
//time O(mn * mn) space O(mn)
func pacificAtlantic(_ matrix: [[Int]]) -> [[Int]] {
    var res = [[Int]]()
    let row = matrix.endIndex
    let col = matrix[0].endIndex
    var matrix = matrix
    func dfsPacific(_ x: Int,_ y:Int, _ val: Int) -> Bool {
        if x < 0 || y < 0 || x == row || y == col {return false}
        if val >= matrix[x][y] {
            if x == 0 || y == 0 {return true}
            if x == row || y == col {return false}
            let curr = matrix[x][y]
            matrix[x][y] = Int.max
            let able = dfsPacific(x-1,y,curr) ||
            dfsPacific(x+1,y,curr) ||
            dfsPacific(x,y+1,curr) ||
            dfsPacific(x,y-1,curr)
            matrix[x][y] = curr
            return able
        } else {
            return false
        }
        
    }
    
    func dfsAtlantic(_ x:Int, _ y:Int, _ val: Int) -> Bool {
        if x < 0 || y < 0 || x == row || y == col {return false}
        
        if val >= matrix[x][y] {
            if x == row - 1 {return true}
            if y == col - 1 {return true}
            if x == -1 || y == -1 {return false}
            let curr = matrix[x][y]
            matrix[x][y] = Int.max
            let able = dfsAtlantic(x-1,y,curr) ||
            dfsAtlantic(x+1,y,curr) ||
            dfsAtlantic(x,y+1,curr) ||
            dfsAtlantic(x,y-1,curr)
            matrix[x][y] = curr
            return able
        } else {
            return false
        }
    }
    
    for i in 0..<row {
        for j in 0..<col {
            if dfsPacific(i,j, matrix[i][j]) && dfsAtlantic(i,j, matrix[i][j]) {
                res.append([i,j])
            }
        }
    }
    return res
}

//time O(mn*mn) space O(mn)
func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
    var res = [[Int]]()
    var dictPacific = [[Int]:Bool]()
    var dictAtlantic = [[Int]:Bool]()
    let row = heights.endIndex
    let col = heights[0].endIndex
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: col), count: row)
    
    func dfsPacific(_ x:Int,_ y:Int, _ val: Int) -> Bool {
        if x < 0 || y < 0 || x == row || y == col || heights[x][y] > val || visited[x][y] {
            return false
        }
        if x == 0 || y == 0 {return true}
        visited[x][y] = true
        var able = dfsPacific(x+1,y,heights[x][y]) ||
            dfsPacific(x-1,y,heights[x][y]) ||
            dfsPacific(x,y+1,heights[x][y]) ||
            dfsPacific(x,y-1,heights[x][y])
        visited[x][y] = false
        return able
    }
    
    func dfsAtlantic(_ x:Int,_ y:Int, _ val: Int) -> Bool { 
        if x < 0 || y < 0 || x == row || y == col || heights[x][y] > val || visited[x][y] {
            return false
        }
        if x == row - 1 || y == col - 1 {return true}
        visited[x][y] = true
        
        var able = dfsAtlantic(x+1,y,heights[x][y]) ||
            dfsAtlantic(x-1,y,heights[x][y]) ||
            dfsAtlantic(x,y+1,heights[x][y]) ||
            dfsAtlantic(x,y-1,heights[x][y])
        visited[x][y] = false
        
        return able
    }
    
    for i in 0..<row {
        for j in 0..<col {
            dictPacific[[i,j]] = dfsPacific(i,j,Int.max)
            dictAtlantic[[i,j]] = dfsAtlantic(i,j, Int.max)
        }
    }
    for i in 0..<row {
        for j in 0..<col {
            if dictPacific[[i,j]]! && dictAtlantic[[i,j]]! {
                res.append([i,j])
            }
        }
    }
    return res
}


//bottom up O(mn) space O(mn)
func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
    let row = heights.endIndex
    let col = heights[0].endIndex
    var pacific = [[Bool]](repeating:[Bool](repeating:false,count:col),count: row)
    var atlantic = [[Bool]](repeating:[Bool](repeating:false,count:col),count: row)
    
    func dfs(_ x:Int,_ y:Int,_ val:Int, _ visited: inout [[Bool]]) {
        if x < 0 || y < 0 || x == row || y == col || val > heights[x][y] || visited[x][y] {return}
        visited[x][y] = true
        dfs(x+1,y,heights[x][y],&visited)
        dfs(x-1,y,heights[x][y],&visited)
        dfs(x,y+1,heights[x][y],&visited)
        dfs(x,y-1,heights[x][y],&visited)
    }
    
    for i in 0..<col {
        dfs(0,i,Int.min,&pacific)
        dfs(row-1,i,Int.min,&atlantic)
    }
    
    for i in 0..<row {
        dfs(i,0,Int.min,&pacific)
        dfs(i,col-1,Int.min,&atlantic)
    }
    
    var res = [[Int]]()
    
    for i in 0..<row {
        for j in 0..<col {
            if pacific[i][j] && atlantic[i][j] {
                res.append([i,j])
            }
        }
    }
    return res
}

//O(mn), O(mn), m = rows, n = cols
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        var pacific = [[Int]: Bool](), atlantic = [[Int]: Bool]()
        let rows = heights.endIndex, cols = heights[0].endIndex
        let direction = [0,1,0,-1,0]
        func dfs(_ x:Int, _ y: Int, _ visited: inout [[Int]: Bool]) {
            visited[[x,y]] = true
            for k in 0..<4 {
                let newX = x+direction[k]
                let newY = y+direction[k+1]
                
                if newX >= 0 && newX<rows && newY >= 0 && newY < cols {
                    if visited[[newX,newY], default: false] == false && heights[newX][newY] >= heights[x][y]  {
                        dfs(newX,newY, &visited)    
                    }
                }
            }
        }
        
        for i in 0..<cols {
            dfs(0,i, &pacific)
            dfs(rows-1,i,&atlantic)
        }
        
        for i in 0..<rows {
            dfs(i,0, &pacific)
            dfs(i,cols-1, &atlantic)
        }
        var res = [[Int]]()
        
        for i in 0..<rows {
            for j in 0..<cols {
                if pacific[[i,j], default: false] && atlantic[[i,j], default:false] {
                    res.append([i,j])
                }
            }
        }
        return res
    }