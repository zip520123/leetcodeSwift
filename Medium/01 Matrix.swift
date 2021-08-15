//01 Matrix
//O(n), O(n),
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        let rows = mat.endIndex, cols = mat[0].endIndex
        var res = (0..<rows).map {_ in (0..<cols).map{_ in 0}}
        for i in 0..<rows {
            for j in 0..<cols {
                if mat[i][j] == 1 {res[i][j] = -1}
            }
        }
        var queue : [(x:Int,y:Int)] = []
        for i in 0..<rows {
            for j in 0..<cols {
                if res[i][j] == 0 {
                    queue.append((i,j))
                }
            }
        }
        let direction = [0,1,0,-1,0]
        while !queue.isEmpty {
            let (x,y) = queue.removeFirst()
            for k in 0..<4 {
                let newX = x+direction[k]
                let newY = y+direction[k+1]
                guard newX>=0, newX<rows, newY>=0, newY<cols, res[newX][newY] == -1 else {continue}
                res[newX][newY] = res[x][y] + 1
                queue.append((newX, newY))
            }
        }
        return res
    }