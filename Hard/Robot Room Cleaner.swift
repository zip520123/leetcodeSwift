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

//
class Solution {
    func cleanRoom(_ robot: Robot) {
        var visited = Set<[Int]>()
        let direction = [0,1,0,-1,0]
        func dfs(_ row: Int, _ col: Int, _ d: Int) {
            robot.clean()
            visited.insert([row,col])
            for k in 0..<4 {
                let newD = (k+d) % 4
                var newX = row + direction[newD]
                var newY = col + direction[newD+1]
                
                if visited.contains([newX, newY]) == false && robot.move() {
                    
                    dfs(newX,newY, newD)
                    goBack()
                }
                robot.turnLeft()
            }
        }
        
        func goBack() {
            robot.turnLeft()
            robot.turnLeft()
            robot.move()
            robot.turnLeft()
            robot.turnLeft()
        }
        
        dfs(0,0,0)
    }
}