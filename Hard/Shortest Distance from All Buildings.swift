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

// O(grid*buildings) O(grid)
func shortestDistance(_ grid: [[Int]]) -> Int {
    let rows = grid.endIndex, cols = grid[0].endIndex
    var distances = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
    var buildingsAbleToMeetAtThePoint = [[Int]: Int]()
    var buildings = 0
    for row in 0..<rows {
        for col in 0..<cols {
            if grid[row][col] == 1 {
                buildings += 1
                var queue = [(row, col)]
                var seen = Set<[Int]>()
                var level = 0
                while !queue.isEmpty {
                    let temp = queue
                    queue = []
                    level += 1
                    for node in temp {
                        let (currRow, currCol) = node
                        for delta in [(0,1), (1,0), (-1,0), (0, -1)] {
                            let (dx, dy) = delta
                            let nextRow = currRow + dx, nextCol = currCol + dy
                            if 0 <= nextRow && nextRow < rows && 0 <= nextCol && nextCol < cols 
                            && seen.contains([nextRow, nextCol]) == false 
                            && grid[nextRow][nextCol] == 0 {
                                seen.insert([nextRow, nextCol])
                                distances[nextRow][nextCol] += level
                                buildingsAbleToMeetAtThePoint[[nextRow,nextCol], default: 0] += 1
                                queue.append((nextRow, nextCol))
                            }
                    
                        }
                    }
                    
                    
                }   

            }
        }
    }
    var res = Int.max
    for row in 0..<rows {
        for col in 0..<cols {
            if buildingsAbleToMeetAtThePoint[[row, col], default: 0] == buildings {
                res = min(res, distances[row][col] )
            }
        }
    }
    
    if res == Int.max {
        return -1
    }
    return res
}