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

//union find DSU O(n^2)
class Solution {
    func removeStones(_ stones: [[Int]]) -> Int {
        var count = 0
        var dict = [[Int]:[Int]]()
        
        func find(_ stone:[Int]) -> [Int] {
            if dict[stone] == stone {return dict[stone]!}
            dict[stone] = find(dict[stone]!)
            return dict[stone]!
        }
        
        func union(_ s1:[Int], _ s2:[Int]) {
            let root1 = find(s1)
            let root2 = find(s2)
            if root1 != root2 {
                count += 1
                dict[root1] = root2
            }     
        }
        
        for stone in stones {
            dict[stone] = stone
        }
        for stone1 in stones {
            for stone2 in stones {
                if stone1[0] == stone2[0] {
                    union(stone1, stone2)    
                }
                if stone1[1] == stone2[1] {
                    union(stone1, stone2)
                }
            }
        }
        return count
    }
}

//O(n) union find transform (x,y) -> (s) Unify index
/*
We think:
a row index, connect two stones on this row
a col index, connect two stones on this col.

In another view：
A stone, connect a row index and col.
*/
class Solution {
    func removeStones(_ stones: [[Int]]) -> Int {
        var count = 0
        var dict = [Int:Int]()
        
        func find(_ p :Int) -> Int {
            if dict[p] == nil {
                dict[p] = p
                count += 1
                return dict[p]!
            }
            if dict[p] == p {
                return dict[p]!
            }
            dict[p] = find(dict[p]!)
            return dict[p]!
        }
        
        func union(_ p1:Int, _ p2:Int) {
            let root1 = find(p1)
            let root2 = find(p2)
            if root1 != root2 {
                count -= 1
                dict[root1] = root2
            }     
        }
        
        for stone in stones {
            union(stone[0],~stone[1])
        }
        
        return stones.endIndex - count
    }
}
