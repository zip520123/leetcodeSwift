// Buddy Strings
// O(n), O(n)
func buddyStrings(_ s: String, _ goal: String) -> Bool {
    var arr = Array(s)
    let goal = Array(goal)

    var dict = [Character: Int]()
    if arr == goal {
        for char in s {
            dict[char, default: 0] += 1
            if dict[char]! >= 2 {
                return true
            }
        }
    }
    var i1 = -1, i2 = -1
    
    for i in 0..<arr.endIndex {
        if arr[i] != goal[i] {
            if i1 == -1 {
                i1 = i
            } else if i2 == -1 {
                i2 = i
            } else {
                return false
            }
        }
    }
    if i2 == -1 {return false}
    (arr[i1], arr[i2]) = (arr[i2], arr[i1])
    return arr == goal
}