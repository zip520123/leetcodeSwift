//Robot Room Cleaner
class Solution {
    func cleanRoom(_ robot: Robot) {
        var visited = Set<[Int]>()
        var direct = [(-1,0),(0,1),(1,0),(0,-1)]
        func dfs(_ row: Int, _ col: Int, _ d: Int) {
            robot.clean()
            visited.insert([row,col])
            for i in 0..<4 {
                let newD = (i + d) % 4
                let (dx, dy) = direct[newD]
                let newRow = row + dx
                let newCol = col + dy
                if visited.contains([newRow, newCol]) == false && robot.move() {
                    dfs(newRow, newCol, newD)
                    goBack()
                }
                robot.turnRight()
            }
        }
        
        func goBack() {
            robot.turnRight()
            robot.turnRight()
            robot.move()
            robot.turnRight()
            robot.turnRight()
        }
        
        dfs(0,0,0)

    }
}