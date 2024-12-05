// Move Pieces to Obtain a String
// O(n), O(1)
func canChange(_ start: String, _ target: String) -> Bool {
    let start = Array(start), target = Array(target)
    var start_index = 0, target_index = 0
    while start_index < start.count || target_index < target.count {
        while start_index < start.count, start[start_index] == "_" {
            start_index += 1
        }
        while target_index < target.count, target[target_index] == "_" {
            target_index += 1
        }
        if start_index == start.count || target_index == target.count {
            return start_index == target_index
        }
        if start[start_index] != target[target_index] ||
            start[start_index] == "L" && start_index < target_index ||
            start[start_index] == "R" && start_index > target_index {
            return false
            }
        start_index += 1
        target_index += 1
    }
    return true
}