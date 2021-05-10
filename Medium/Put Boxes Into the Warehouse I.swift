//Put Boxes Into the Warehouse I
//brute force TLE O(n log n * k^2), O(n), n = boxes, k = warehouse
    func maxBoxesInWarehouse(_ boxes: [Int], _ warehouse: [Int]) -> Int {
        let sortedBoxes = boxes.sorted()
        var r = warehouse.endIndex - 1
        var res = 0
        for box in sortedBoxes {
            var ableToPut = false
            var i = 0
            while i <= r {
                if box <= warehouse[i] {
                    ableToPut = true
                    i += 1
                } else {
                    break
                }
            }
            
            if ableToPut {
                res += 1
                r = i - 2
            }
        }
        return res
    }

//O(n log n + k), n = boxes, k = warehouse
    func maxBoxesInWarehouse(_ boxes: [Int], _ warehouse: [Int]) -> Int {
        let sortedBoxes = boxes.sorted()
        var res = 0
        var warehouse = warehouse
        for i in 1..<warehouse.endIndex {
            warehouse[i] = min(warehouse[i], warehouse[i-1])
        }
        var i = warehouse.endIndex - 1
        for box in sortedBoxes {
            while i >= 0 && box > warehouse[i] {
                i -= 1
            }
            if i >= 0 {
                res += 1
                i -= 1
            }
        }
        return res
    }