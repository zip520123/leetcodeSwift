// Path With Minimum Effort
// O(n!), O(n), TLE
   struct Path: Hashable {
        let x: Int
        let y: Int
        let curr: Int
        let seen: Set<[Int]>
    }

    func minimumEffortPath(_ heights: [[Int]]) -> Int {
        var res = Int.max
        let rows = heights.endIndex, cols = heights[0].endIndex
        var memo = [Path: Int]()

        func dfs(_ x: Int, _ y: Int, _ curr: Int, _ seen: Set<[Int]>) -> Int {
            let path = Path(x: x, y: y, curr: curr, seen: seen)
            if memo[path] != nil {return memo[path]!}
            if x == rows-1, y == cols-1 {
                return curr
            }
            var seen = seen
            let currHeight = heights[x][y]
            var res = curr
            if x+1>=0 && x+1<rows && y>=0 && y<cols && seen.contains([x+1,y]) == false {
                seen.insert([x+1,y])
                res = min(res, dfs(x+1,y, max(curr, abs(currHeight - heights[x+1][y])), seen)) 
                seen.remove([x+1,y])
            }
            if x-1>=0 && x-1<rows && y>=0 && y<cols && seen.contains([x-1,y]) == false {
                seen.insert([x-1,y])
                res = min(res, dfs(x-1,y, max(curr, abs(currHeight - heights[x-1][y])), seen))
                seen.remove([x-1,y])
            }

            if x>=0 && x<rows && y+1>=0 && y+1<cols && seen.contains([x,y+1]) == false {
                seen.insert([x,y+1])
                res = min(res, dfs(x,y+1, max(curr, abs(currHeight - heights[x][y+1])), seen))
                
                seen.remove([x,y+1])
            }
            if x>=0 && x<rows && y-1>=0 && y-1<cols && seen.contains([x,y-1]) == false {
                seen.insert([x,y-1])
                res = min(res, dfs(x,y-1, max(curr, abs(currHeight - heights[x][y-1])), seen))
                seen.remove([x,y-1])
            }
            memo[path] = res
            return res
        }
        
        return dfs(0,0,0,Set([[0,0]]))
    }