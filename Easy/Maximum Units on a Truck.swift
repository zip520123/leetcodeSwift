//Maximum Units on a Truck
//O(n log n + n), O(n), n = boxTypes.len
    func maximumUnits(_ boxTypes: [[Int]], _ truckSize: Int) -> Int {
        let sorted = boxTypes.sorted { a,b in a[1] > b[1]}
        var res = 0, truckSize = truckSize, i = 0
        while truckSize > 0 && i < sorted.endIndex {
            let boxes = sorted[i][0]
            let units = sorted[i][1]
            let count = min(truckSize, boxes)
            res += count * units
            truckSize -= count
            i += 1
        }
        return res
    }

//O(n log n), O(n)
    func maximumUnits(_ boxTypes: [[Int]], _ truckSize: Int) -> Int {
        let arr = boxTypes.sorted { a,b in a[1]>b[1]}
        var res = 0, curr = truckSize
        for item in arr {
            let boxes = item[0], units = item[1]
            if boxes <= curr {
                res += boxes * units
                curr -= boxes
            } else {
                res += curr * units
                break
            }
        }
        return res
    }