// Rotating the Box
// O(n), O(n)
func rotateTheBox(_ box: [[Character]]) -> [[Character]] {
    let rows = box.endIndex, cols = box[0].endIndex
    var box = box
    for row in 0..<rows {
        var last_obstacle_index = -1
        for col in 0..<cols {
            if box[row][col] == "*" {
                var l = last_obstacle_index + 1, r = col-1
                last_obstacle_index = col
                while r > l, box[row][r] != "." {
                    r -= 1
                }

                while l < r {
                    if box[row][l] == "#" {
                        (box[row][l], box[row][r]) = (box[row][r], box[row][l])
                        while r > l, box[row][r] != "." {
                            r -= 1
                        }
                    }
                    l += 1
                }
            }
        }
        var l = last_obstacle_index + 1, r = cols-1
        while r > l, box[row][r] != "." {
            r -= 1
        }

        while l < r {
            if box[row][l] == "#" {
                (box[row][l], box[row][r]) = (box[row][r], box[row][l])
                while r > l, box[row][r] != "." {
                    r -= 1
                }
            }
            l += 1
        }
    }

    var res = [[Character]](repeating: [Character](repeating: Character("."), count:rows), count: cols)

    for row in 0..<rows {
        for col in 0..<cols {
            res[col][rows-row-1] = box[row][col]
        }
    }
    return res
}