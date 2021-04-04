/*Most Stones Removed with Same Row or Column*/
func removeStones(_ stones: [[Int]]) -> Int {
        
        var restStone = Set(stones)
        var seenStone = Set<[Int]>()
        var seenLine = Set<String>()
        var res = 0
        while !restStone.isEmpty {
            let stone = restStone.removeFirst()
            seenStone.insert(stone)
            let lineRow = "R\(stone[0])"
            let lineCol = "C\(stone[1])"
            var lineQueue = [lineRow,lineCol]
            var group = 1
            while !lineQueue.isEmpty {
                let line = lineQueue.removeFirst()
                if seenLine.contains(line) == false { 
                    var stonesNeedToRemove = [[Int]]()

                    for otherStone in restStone {
                        if seenStone.contains(otherStone) == false {
                            let otherRow = "R\(otherStone[0])"
                            let otherCol = "C\(otherStone[1])"
                            if line == otherRow || line == otherCol {
                                if seenLine.contains(otherRow) == false {lineQueue.append(otherRow)}
                                if seenLine.contains(otherCol) == false {lineQueue.append(otherCol)}
                                
                                stonesNeedToRemove.append(otherStone)
                                seenStone.insert(otherStone)
                                group += 1
                            }

                        }
                    }
                    for stone in stonesNeedToRemove {
                        restStone.remove(stone)
                    }
                    seenLine.insert(line)
                }

            }
            res += group - 1
        }
        return res
    }

//ac O(n^2) O(n) subtract faster than remove each stone
func removeStones(_ stones: [[Int]]) -> Int {
        var restStones = Set(stones)
        
        var seenLines = Set<String>()
        var res = 0
        while !restStones.isEmpty {
            let stone = restStones.removeFirst()
            
            let lineRow = "R\(stone[0])"
            let lineCol = "C\(stone[1])"
            var lineQueue = [lineRow,lineCol]
            var group = 1
            while !lineQueue.isEmpty {
                let line = lineQueue.removeFirst()
                if seenLines.contains(line) == false { 
                    
                    var tempStones = Set<[Int]>()
                    
                    for otherStone in restStones {
                        let otherRow = "R\(otherStone[0])"
                        let otherCol = "C\(otherStone[1])"
                        if line == otherRow || line == otherCol {
                            if seenLines.contains(otherRow) == false {lineQueue.append(otherRow)}
                            if seenLines.contains(otherCol) == false {lineQueue.append(otherCol)}
                            
                            group += 1
                            tempStones.insert(otherStone)
                        }
                    }
                    restStones.subtract(tempStones)
                    seenLines.insert(line)
                }

            }
            res += group - 1
        }
        return res
    }