class Heap {
    private var arr = [Int]()
    private let compare: (Int, Int) -> Bool 
    init(_ c: @escaping (Int, Int)->Bool = {$0<$1}) {
        self.compare = c
    }
    
    func insert(_ n: Int) {
        arr.append(n)
        var parentIndex = (arr.endIndex-1)/2
        var currIndex = arr.endIndex-1
        while currIndex != 0, compare(arr[currIndex], arr[parentIndex]) {
            (arr[parentIndex], arr[currIndex]) = (arr[currIndex], arr[parentIndex])
            currIndex = parentIndex
            parentIndex /= 2
        }
    }
    
    func top() -> Int {
        arr[0]
    }
    
    func removeTop() -> Int {
        let res = arr[0]
        arr[0] = arr[arr.endIndex-1]
        arr.removeLast()
        var currIndex = 0
        var leftIndex = currIndex*2+1
        var rightIndex = currIndex*2+2
        var targetIndex = currIndex
        while leftIndex < arr.endIndex || rightIndex < arr.endIndex {
            if leftIndex < arr.endIndex, compare(arr[leftIndex], arr[currIndex]) {
                targetIndex = leftIndex
            }
            if rightIndex < arr.endIndex, compare(arr[rightIndex], arr[currIndex]) {
                targetIndex = rightIndex
            }
            if targetIndex == currIndex {break}
            (arr[currIndex], arr[targetIndex]) = (arr[targetIndex], arr[currIndex]) 
            currIndex = targetIndex
            leftIndex = currIndex*2+1
            rightIndex = currIndex*2+2
        }
        
        return res
    }

}

let heap = Heap()
heap.insert(10)
heap.top()
heap.insert(3)
heap.insert(2)

for _ in 0...2 {
    print(heap.removeTop())
}
