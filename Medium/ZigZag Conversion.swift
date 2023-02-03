//ZigZag Conversion
//
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 {return s}
        var rows = [[Character]](repeating: [], count: numRows)
        var index = 0
        var isDown = false
        for char in s {
            rows[index].append(char)
            if index == 0 || index == numRows-1 {
                isDown = !isDown
            }
            index += isDown ? 1 : -1
        }
        return String(rows.reduce([], +))
    }
    let input = "PAYPALISHIRING"
    let input2 = 4
print(convert(input,input2) == "PINALSIGYAHRPI")
