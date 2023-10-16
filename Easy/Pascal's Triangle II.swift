// Pascal's Triangle II
// O(n), O(n)
    func getRow(_ rowIndex: Int) -> [Int] {
        var arr = [[Int]]()
        for row in 0...rowIndex {
            var curr = [Int]()
            for i in 0...row {
                if i == 0 || i == row {
                    curr.append(1)
                } else{
                    curr.append(arr[row-1][i-1]+arr[row-1][i])
                }
            }
            arr.append(curr)
        }
        return arr.last!
    }

// O(n), O(1)
    func getRow(_ rowIndex: Int) -> [Int] {
        var arr = [Int]()
        for row in 0...rowIndex {
            var curr = [Int]()
            for i in 0...row {
                if i == 0 || i == row {
                    curr.append(1)
                } else{
                    curr.append(arr[i-1]+arr[i])
                }
            }
            arr = curr
        }
        return arr
    }