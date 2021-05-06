//Shortest Distance from All Buildings
//O(grid*buildings) O(grid)
class Solution {
    func shortestDistance(_ grid: [[Int]]) -> Int {
        var totalBuilding = 0
        var numOfBuildingAbleToAchievePosistion = [[Int]:Int]()
        var distanceToAllBuilding = [[Int]:Int]()
        let rows = grid.endIndex, cols = grid[0].endIndex
        let shift = [0,1,0,-1,0]
        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == 1 {
                    totalBuilding += 1
                    var queue = [[i,j]]
                    var seen = Set<[Int]>([[i,j]])
                    var level = 0
                    while !queue.isEmpty {
                        level += 1
                        let temp = queue
                        queue.removeAll()
                        for node in temp {
                            let x = node[0], y = node[1]
                            for k in 0..<4 {
                                let newX = x+shift[k], newY = y+shift[k+1]
                                if newX >= 0 && newX < rows && newY >= 0 && newY < cols 
                                && grid[newX][newY] == 0 
                                && seen.contains([newX,newY]) == false {
                                    seen.insert([newX,newY])
                                    numOfBuildingAbleToAchievePosistion[[newX,newY], default:0]+=1
                                    distanceToAllBuilding[[newX,newY], default:0] += level   
                                    queue.append([newX, newY])
                                }
                                
                            }
                        }
                    }
                    
                }
            }
        }
        var res = Int.max
        for i in 0..<rows {
            for j in 0..<cols {
                if numOfBuildingAbleToAchievePosistion[[i,j], default:0] == totalBuilding {
                    res = min(res, distanceToAllBuilding[[i,j]]!)
                }
            }
        }
        return res == Int.max ? -1 : res
    }
}