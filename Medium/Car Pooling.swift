//Car Pooling
//O(n log n), O(n)
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        var dict = [Int: Int]()
        for trip in trips {
            let p = trip[0], start = trip[1], end = trip[2]
            dict[start, default:0] += p
            dict[end, default: 0] -= p
        }
        var curr = 0
        for i in dict.keys.sorted() {
            curr += dict[i, default: 0]
            if curr > capacity {return false}
        }
        return true
    }

//O(n), O(n)
func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
    var dict = [Int: Int]()
    for trip in trips {
        let p = trip[0], start = trip[1], end = trip[2]
        dict[start, default:0] += p
        dict[end, default: 0] -= p
    }
    var curr = 0
    for i in 0...1000 {
        curr += dict[i, default: 0]
        if curr > capacity {return false}
    }
    return true
}