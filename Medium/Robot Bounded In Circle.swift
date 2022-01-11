//Robot Bounded In Circle
//O(n), O(1)
    func isRobotBounded(_ instructions: String) -> Bool {
        var x = 0, y = 0, dx = 0, dy = 1
        for char in instructions {
            switch char {
                case "R":
                    (dx, dy) = (dy, -dx)
                case "L":
                    (dx, dy) = (-dy, dx)
                case "G":
                    x+=dx
                    y+=dy
                default:
                    break
            }
        }
        return x==0 && y==0 || !(dx == 0 && dy == 1)
    }