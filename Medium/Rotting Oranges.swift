//Rotting Oranges
//O(n), O(n)
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var freshOranges = Set<[Int]>()
        let rows = grid.endIndex, cols = grid[0].endIndex
        var queue = [[Int]]()
        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == 1 {
                    freshOranges.insert([i,j])
                } else if grid[i][j] == 2 {
                    queue.append([i,j])
                }
            }
        }
        var res = 0
        while !queue.isEmpty && !freshOranges.isEmpty {
            let temp = queue
            queue.removeAll()
            for item in temp {
                let x = item[0], y = item[1]
                let bottom = [x+1,y]
                if freshOranges.contains(bottom) {
                    queue.append(bottom)
                    freshOranges.remove(bottom)
                }
                let top = [x-1,y]
                if freshOranges.contains(top) {
                    queue.append(top)
                    freshOranges.remove(top)
                }
                let left = [x,y-1]
                if freshOranges.contains(left) {
                    queue.append(left)
                    freshOranges.remove(left)
                }
                let right = [x,y+1]
                if freshOranges.contains(right) {
                    queue.append(right)
                    freshOranges.remove(right)
                }
                
            }
            res += 1
        }
        
        return freshOranges.isEmpty ? res : -1
    }