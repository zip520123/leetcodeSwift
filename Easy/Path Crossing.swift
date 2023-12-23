// Path Crossing
// O(n), O(n)
func isPathCrossing(_ path: String) -> Bool {
    var pointsSet = Set<[Int]>()
    var curr = [0,0]
    pointsSet.insert(curr)
    for char in path {
        switch char {
            case "N":
                curr = [curr[0], curr[1]+1]
            case "S":
                curr = [curr[0], curr[1]-1]
            case "E":
                curr = [curr[0]+1, curr[1]]
            case "W":
                curr = [curr[0]-1, curr[1]]
            default:
                break
        }
        if pointsSet.contains(curr) { return true }
        pointsSet.insert(curr)
    }
    return false
}