//Champagne Tower
//O(row*row), O(row*row)
    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        var arr: [[Double]] = (0...(query_row+1)).map {_ in (0...(query_row+1)).map {_ in 0 } }
        arr[0][0] = Double(poured)
        
        for row in 0...query_row {
            for col in 0...row {
                let q = (arr[row][col] - 1) / 2
                if q > 0 {
                    arr[row+1][col] += q
                    arr[row+1][col+1] += q
                }
            }
        }
        
        return arr[query_row][query_glass] > 1 ? 1 : arr[query_row][query_glass]
    }