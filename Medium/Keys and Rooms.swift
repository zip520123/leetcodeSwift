//Keys and Rooms
//O(n), O(n)
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var seen = Set<Int>([0])
        var queue = [0]
        while !queue.isEmpty {
            let temp = queue
            queue.removeAll()
            for node in temp {
                for next in rooms[node] {
                    if seen.contains(next) == false {
                        queue.append(next)
                        seen.insert(next)
                    }
                }
            }
            
        }
        
        for i in 0..<rooms.endIndex {
            if seen.contains(i) == false {
                return false
            }    
        }
        return true
    }