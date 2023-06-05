//Check If It Is a Straight Line
//O(n), O(1)
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        let n = coordinates.endIndex
        let node1 = coordinates[0], node2 = coordinates[1]
        let x1 = node1[0], y1 = node1[1], x2 = node2[0], y2 = node2[1]
        let dx1 = Double(x1-x2) 
        let dy1 = Double(y1-y2)

        for i in 0..<n-1 {
            let node1 = coordinates[i], node2 = coordinates[i+1]
            let x1 = node1[0], y1 = node1[1], x2 = node2[0], y2 = node2[1]
            let dx2 = Double(x1-x2)
            let dy2 = Double(y1-y2)
            if dx1 * dy2 != dx2 * dy1  {return false}
            
        }
        return true
    }