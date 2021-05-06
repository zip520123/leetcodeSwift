//Lonely Pixel I
//O(mn) O(m+n)
class Solution {
    func findLonelyPixel(_ picture: [[Character]]) -> Int {
        let rows = picture.endIndex, cols = picture[0].endIndex
        var rowCount = (0..<rows).map{_ in 0}
        var colCount = (0..<cols).map{_ in 0}
        for i in 0..<rows {
            for j in 0..<cols {
                if picture[i][j] == "B" {
                    rowCount[i] += 1
                    colCount[j] += 1
                }
            }
        }
        var res = 0
        for i in 0..<rows {
            for j in 0..<cols {
                if picture[i][j] == "B" && rowCount[i] == 1 && colCount[j] == 1{
                    res += 1
                }
            }
        }
        return res
    }
}