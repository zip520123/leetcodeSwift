//Create Sorted Array through Instructions
func createSortedArray(_ instructions: [Int]) -> Int {
        var arr = [Int]()
        var cost = 0
        
        for insertNum in instructions {
            var minCount = 0
            var maxCount = 0
            for n in arr {
                if n < insertNum {
                    minCount += 1
                } else if n > insertNum {
                    maxCount += 1
                }
            }
            arr.insert(insertNum, at: minCount)
            cost += min(minCount, maxCount)
        }
        
        return cost
    }