// Number of Laser Beams in a Bank
// O(n), O(n)
func numberOfBeams(_ bank: [String]) -> Int {
    var res = 0
    var rows = [String]()
    for row in bank {
        var ones = 0
        for char in row {
            if char == "1" { ones += 1 }
        }
        if ones > 0 {
            rows.append(row)
        }
    }
    var i = 0
    while i < rows.endIndex-1 {
        var l = 0
        for char in rows[i] {
            if char == "1" { l += 1 }
        }
        var r = 0
        for char in rows[i+1] {
            if char == "1" { r += 1 }
        }
        res += l*r
        i += 1
    }
    return res
}