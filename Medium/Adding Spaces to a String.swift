// Adding Spaces to a String
// O(n), O(1)
func addSpaces(_ s: String, _ spaces: [Int]) -> String {
    var res = ""
    let arr_s = Array(s)
    var space_index = 0
    for i in 0..<arr_s.endIndex {
        if space_index < spaces.endIndex, spaces[space_index] == i {
            res += " "
            space_index += 1
        }
        res += String(arr_s[i])
    }
    return res
}