// Design Graph With Shortest Path Calculator

class Graph {
    private var graph = [Int: [[Int]]]()
    private struct CostToNode: Comparable {
        let cost: Int
        let node: Int
        
        static func <(lhs: CostToNode, rhs: CostToNode) -> Bool {
            lhs.cost < rhs.cost
        }
    }
    init(_ n: Int, _ edges: [[Int]]) { //O(n)
        for edge in edges {
            let curr = edge[0], next = edge[1], cost = edge[2]
            graph[curr, default: []].append([next, cost])
        }
    }
    
    func addEdge(_ edge: [Int]) { //O(1)
        let curr = edge[0], next = edge[1], cost = edge[2]
        graph[curr, default: []].append([next, cost])
    }
    
    func shortestPath(_ node1: Int, _ node2: Int) -> Int { //O(n)
        var seen = Set<Int>()
        
        var pqueue = Heap<CostToNode>()
        pqueue.insert(CostToNode(cost: 0, node: node1))
        
        while !pqueue.isEmpty {
            let costToNode = pqueue.removeTop()
            let currCost = costToNode.cost
            let currNode = costToNode.node
            
            if currNode == node2 {return currCost}
            seen.insert(currNode)
            for nextNode in graph[currNode, default: []] {
                let next = nextNode[0]
                let nextCost = nextNode[1]
                if seen.contains(next) == false {
                    pqueue.insert(CostToNode(cost: currCost+nextCost, node: next))
                }
            }
        }
        return -1
    }
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
            currIndex = targetIndex

        }
        return res
    }
}