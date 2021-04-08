//ZigZag Conversion
//
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 {return s}
        var rows = [[Character]](repeating:[Character]() , count: numRows)
        var goingDown = false
        var index = 0
        for char in s {
            rows[index].append(char)
            if index == 0 || index == numRows - 1 {goingDown = !goingDown}
            index += goingDown ? 1 : -1
            
        }
        return String(rows.reduce([],+))
    }
    let input = "PAYPALISHIRING"
    let input2 = 4
print(convert(input,input2) == "PINALSIGYAHRPI")
