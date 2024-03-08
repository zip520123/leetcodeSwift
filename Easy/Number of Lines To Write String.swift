// Number of Lines To Write String
// O(n), O(n)
func numberOfLines(_ widths: [Int], _ s: String) -> [Int] {
    var lines = 1, currWidths = 0
    let arr = Array(s)
    for char in arr {
        let width = widths[Int(char.asciiValue!) - Int(Character("a").asciiValue!)]
        if currWidths + width > 100 {
            currWidths = 0
            lines += 1
        }
        currWidths += width
    }
    return [lines, currWidths]
}