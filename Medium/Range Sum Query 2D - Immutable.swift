//Range Sum Query 2D - Immutable
//O(mn), O(mn)
class NumMatrix {
    var dict = [[Int]:Int]()
    init(_ matrix: [[Int]]) { //O(mn)
        let rows = matrix.endIndex, cols = matrix[0].endIndex
        for i in 0..<rows {
            var sum = 0
            for j in 0..<cols {
                sum += dict[[i-1,j], default:0] + matrix[i][j] - dict[[i-1,j-1], default:0]
                dict[[i,j]] = sum
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int { //O(1)
        return dict[[row2,col2],default:0] + dict[[row1-1,col1-1],default:0] - dict[[row1-1,col2], default:0] - dict[[row2,col1-1], default:0]
    }
}


class NumMatrix {
    var dict = [[Int]: Int]()
    init(_ matrix: [[Int]]) {
        let rows = matrix.endIndex, cols = matrix[0].endIndex
        for i in 0..<rows {
            for j in 0..<cols {
                dict[[i,j]] = dict[[i,j-1], default: 0] + dict[[i-1,j],default:0] - dict[[i-1,j-1],default: 0] + matrix[i][j]
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        return dict[[row2,col2],default:0] - dict[[row1-1,col2], default:0] - dict[[row2,col1-1], default:0] + dict[[row1-1,col1-1], default: 0]
    }
}