//Network Delay Time
//DFS O((n-1)! + E), O(n+E)
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        
        var dict = [Int: [(node: Int, time: Int)]]()
        for time in times {
            let source = time[0], dist = time[1], wei = time[2]
            dict[source, default:[]].append((dist, wei))
        }
        
        var signalReceived = (0...n).map {_ in Int.max}
        
        func dfs(_ curr: Int, _ time: Int) {
            if time >= signalReceived[curr] {return}
            signalReceived[curr] = time
            for (node, travelTime) in dict[curr, default:[]] {
                dfs(node, time + travelTime)    
            }
        }
        
        dfs(k, 0)
        var res = Int.min
        for node in 1...n {
            res = max(res, signalReceived[node])
        }
        return res == Int.max ? -1 : res
    }

//BFS O(n*E), O(n*E)
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var arr = (0...n).map {_ in Int.max}
        var graph = [Int:[(Int, Int)]]()
        for t in times {
            let source = t[0], dest = t[1], time = t[2]
            graph[source, default: []].append((dest, time))
        }
        
        var queue = [k]
        arr[k] = 0
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            for (next, time) in graph[curr, default: []] {
                let travelTime = arr[curr] + time
                if arr[next] > travelTime {
                    arr[next] = travelTime
                    queue.append(next)
                }
            }
        }
        var res = Int.min
        for node in 1...n {
            res = max(res, arr[node])
        }
        return res == Int.max ? -1 : res
    }

//Heap ?
class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var arr = (0...n).map {_ in Int.max}
        var graph = [Int:[(Int, Int)]]()
        for t in times {
            let source = t[0], dest = t[1], time = t[2]
            graph[source, default: []].append((dest, time))
        }
        
        var heap = Heap() { arr[$0] < arr[$1] }
        heap.insert(k)
        arr[k] = 0
        while !heap.isEmpty() {
            let curr = heap.removeTop()
            
            for (next, time) in graph[curr, default: []] {
                let travelTime = arr[curr] + time
                if arr[next] > travelTime {
                    arr[next] = travelTime
                    heap.insert(next)
                }
            }
        }
        var res = Int.min
        for node in 1...n {
            res = max(res, arr[node])
        }
        return res == Int.max ? -1 : res
    }
    
  class Heap {
    private var arr = [Int]()
    private let compare: (Int, Int) -> Bool 
    init(_ c: @escaping (Int, Int)->Bool = {$0<$1}) {
        self.compare = c
    }
    func isEmpty() -> Bool {
        arr.isEmpty
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
}