//  Check if Grid can be Cut into Sections
// O(nlogn), O(n) 
    func checkValidCuts(_ n: Int, _ rectangles: [[Int]]) -> Bool {
        var x_arr = [[Int]]()
        var y_arr = [[Int]]()
        for i in 0..<rectangles.endIndex {
            let x_start = rectangles[i][0]
            let x_end = rectangles[i][1]
            let y_start = rectangles[i][2]
            let y_end = rectangles[i][3]
            
            x_arr.append([x_start, x_end])
            y_arr.append([y_start, y_end])
        }
        x_arr.sort { a, b in
            a[0] < b[0]
        }
        
        y_arr.sort { a, b in
            a[0] < b[0]
        }
        
        func check_gaps(_ arr: [[Int]]) -> Int {
            var curr = arr[0][1]
            var gaps = 0
            for i in 1..<arr.endIndex {
                if arr[i][0] >= curr {
                    gaps += 1
                }
                curr = max(curr, arr[i][1])
            }
            return gaps
        }

        return check_gaps(x_arr) >= 2 || check_gaps(y_arr) >= 2
    }