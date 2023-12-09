// Minimum Amount of Time to Collect Garbage
// O(n), O(1)
func garbageCollection(_ garbage: [String], _ travel: [Int]) -> Int {
    var g = 0
    var distance = 0
    for i in 0..<garbage.endIndex {
        if i != 0 {
            distance += travel[i-1]
        }
        let curr = garbage[i]
        for char in curr {
            switch char {
                case "G":
                    g += distance
                    distance = 0
                    g += 1
                default: 
                    break
            }
        }
    }
    var p = 0
    distance = 0
    for i in 0..<garbage.endIndex {
        if i != 0 {
            distance += travel[i-1]
        }
        let curr = garbage[i]
        for char in curr {
            switch char {
                case "P":
                    p += distance
                    distance = 0
                    p += 1
                default: 
                    break
            }
        }
    }
    
    var m = 0
    distance = 0
    for i in 0..<garbage.endIndex {
        if i != 0 {
            distance += travel[i-1]
        }
        let curr = garbage[i]
        for char in curr {
            switch char {
                case "M":
                    m += distance
                    distance = 0
                    m += 1
                default: 
                    break
            }
        }
    }

    return g+p+m

}