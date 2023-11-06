class Heap {
    private var arr = [Int]()
    private let compare: (Int, Int) -> Bool
    init(_ c: @escaping (Int, Int)->Bool = {$0<$1}) {
        self.compare = c
    }

    func insert(_ n: Int) {
        arr.append(n)

        var currIndex = arr.endIndex-1
        while currIndex > 0 && compare(arr[currIndex], arr[(currIndex-1)/2]) {
            arr.swapAt((currIndex-1)/2, currIndex) 
            currIndex = (currIndex-1)/2
        }
    }
    
    func top() -> Int {
        arr[0]
    }
    
    func removeTop() -> Int {
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

            if leftIndex < arr.endIndex && compare(arr[leftIndex], arr[targetIndex]) {
                targetIndex = leftIndex
            }
            if rightIndex < arr.endIndex && compare(arr[rightIndex], arr[targetIndex]) {
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

class Heap {
    private var heap: [Int] = []

    func insert(_ element: Int) {
        heap.append(element)
        var currentIndex = heap.count - 1

        while currentIndex > 0 && heap[currentIndex] < heap[(currentIndex-1)/2] {
            heap.swapAt(currentIndex, (currentIndex-1)/2)
            currentIndex = (currentIndex-1)/2
        }
    }

    func removeTop() -> Int {
        if heap.count == 1 {return heap.removeFirst()}

        let topElement = heap[0]

        heap[0] = heap.removeLast()
        // heap[0] = heap[heap.endIndex-1] x5 slower
        // heap.removeLast()

        var currentIndex = 0

        while true {
            let leftChildIndex = 2*currentIndex+1
            let rightChildIndex = 2*currentIndex+2

            var minIndex = currentIndex
            if leftChildIndex < heap.count && heap[leftChildIndex] < heap[minIndex] {
                minIndex = leftChildIndex
            }
            if rightChildIndex < heap.count && heap[rightChildIndex] < heap[minIndex] {
                minIndex = rightChildIndex
            }
            if minIndex == currentIndex {
                break
            }
            heap.swapAt(currentIndex, minIndex)
            currentIndex = minIndex
        }
        return topElement
    }
}