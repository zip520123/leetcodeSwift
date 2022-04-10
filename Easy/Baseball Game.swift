//Baseball Game
//O(n),O(n)
    func calPoints(_ ops: [String]) -> Int {
        var arr = [Int]()
        for op in ops {
            switch op {
                case "+":
                    let n = arr[arr.endIndex-1] + arr[arr.endIndex-2]
                    arr.append(n)
                case "D":
                    let n = arr[arr.endIndex-1] * 2
                    arr.append(n)
                case "C":
                    arr.removeLast()
                default: 
                    let n = Int(op)!
                    arr.append(n)
            }
        }
        return arr.reduce(0,+)
    }