// Eliminate Maximum Number of Monsters
// O(n log n), O(n)
func eliminateMaximum(_ dist: [Int], _ speed: [Int]) -> Int {
    var arr = [Double]()
    for i in 0..<dist.endIndex {
        arr.append(Double(dist[i]) / Double(speed[i]))
    }
    arr.sort()
    var res = 0
    for i in 0..<arr.endIndex {
        if Double(i) >= arr[i] {break}
        res += 1
    }
    return res
}

// O(n log n), O(n), heap
func eliminateMaximum(_ dist: [Int], _ speed: [Int]) -> Int {
    var arr = [Double]()
    for i in 0..<dist.endIndex {
        arr.append(Double(dist[i]) / Double(speed[i]))
    }
    let heap = Heap<Double>()
    for arrival in arr {
        heap.insert(arrival)
    }
    var time = 0
    while !heap.isEmpty {
        if heap.top() <= Double(time) {
            break
        }
        heap.removeTop()
        time += 1
    }
    return time
}
class Heap<T: Comparable> {
    private var arr = [T]()
    var isEmpty: Bool { return arr.isEmpty }
    func insert(_ n: T) {
        arr.append(n)

        var currIndex = arr.endIndex-1
        while currIndex > 0 && arr[currIndex] < arr[(currIndex-1)/2] {
            arr.swapAt((currIndex-1)/2, currIndex) 
            currIndex = (currIndex-1)/2
        }
    }
    
    func top() -> T {
        arr[0]
    }
    
    func removeTop() -> T {
        if arr.count == 1 {return arr.removeLast()}
        let res = arr[0]
        arr[0] = arr.removeLast()

        // arr[0] = arr[arr.endIndex-1]
        // arr.removeLast() 5x slower
        
        var currIndex = 0
        
        while true {
            let leftIndex = currIndex*2+1
            let rightIndex = currIndex*2+2
            var targetIndex = currIndex

            if leftIndex < arr.endIndex && arr[leftIndex] < arr[targetIndex] {
                targetIndex = leftIndex
            }
            if rightIndex < arr.endIndex && arr[rightIndex] < arr[targetIndex] {
                targetIndex = rightIndex
            }
            if targetIndex == currIndex {break}
            arr.swapAt(targetIndex, currIndex) 
            // (arr[currIndex], arr[targetIndex]) = (arr[targetIndex], arr[currIndex]) TLE
            currIndex = targetIndex

        }
        return res
    }
}