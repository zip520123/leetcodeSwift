// Determine if a Cell Is Reachable at a Given Time
// O(1), O(1) math
func isReachableAtTime(_ sx: Int, _ sy: Int, _ fx: Int, _ fy: Int, _ t: Int) -> Bool {
    let width = abs(sx-fx)
    let heigh = abs(sy-fy)
    if width == 0 && heigh == 0 && t == 1 {return false}
    return t >= max(width, heigh)
}