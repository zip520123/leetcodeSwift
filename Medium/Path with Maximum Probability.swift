// Path with Maximum Probability
//O(n^2), O(n^2) TLE
    func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
        
        var dict = [Int: [(Int, Double)]]()
        for i in 0..<edges.endIndex {
            let edge = edges[i]
            let a = edge[0], b = edge[1], prob = succProb[i]
            dict[a, default:[]].append((b, prob))
            dict[b, default:[]].append((a, prob))
        }
        
        func dfs(_ set: Set<Int>, _ currProb: Double, _ currNode: Int) -> Double {
            if currNode == end {
                return currProb
            }
            var res = 0.0
            var nextSet = set
            nextSet.insert(currNode)
            for (next, nextProb) in dict[currNode, default: []] {
                if set.contains(next) == false {
                    res = max(res, dfs(nextSet, currProb*nextProb, next))
                }
            }
            return res
        }

        return dfs(Set(), 1, start)
    }


//O(n^2), O(n^2) TLE
    func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
        struct Status: Hashable {
            let set: Set<Int>
            let prob: Double
            let node: Int
        }
        var dict = [Int: [(Int, Double)]]()
        for i in 0..<edges.endIndex {
            let edge = edges[i]
            let a = edge[0], b = edge[1], prob = succProb[i]
            dict[a, default:[]].append((b, prob))
            dict[b, default:[]].append((a, prob))
        }
        
        var memo = [Status: Double]()
        func dfs(_ set: Set<Int>, _ currProb: Double, _ currNode: Int) -> Double {
            let status = Status(set: set, prob: currProb, node: currNode)
            if memo[status] != nil {
                return memo[status]!
            }
            if currNode == end {
                return currProb
            }
            var res = 0.0
            var nextSet = set
            nextSet.insert(currNode)
            for (next, nextProb) in dict[currNode, default: []] {
                if set.contains(next) == false {
                    res = max(res, dfs(nextSet, currProb*nextProb, next))
                }
            }
            memo[status] = res
            return res
        }

        return dfs(Set(), 1, start)
    }

// O(n^2), O(n^2)
class Solution {
    func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
        var dict = [Int: [(Int, Double)]]()
        for i in 0..<edges.endIndex {
            let edge = edges[i]
            let a = edge[0], b = edge[1], prob = succProb[i]
            dict[a, default:[]].append((b, prob))
            dict[b, default:[]].append((a, prob))
        }
        
        var arr = (0..<n).map {_ in 0.0}
        arr[start] = 1
        var heap = [(-1.0, start)]
        while !heap.isEmpty {
            let (prob, node) = heap.removeFirst()
            if node == end {
                return -prob
            }
            for (next, nextProb) in dict[node, default:[]] {
                if arr[next] < -prob*nextProb {
                    arr[next] = -prob*nextProb
                    let i = insertIndex(heap, prob*nextProb)
                    heap.insert((prob*nextProb, next), at: i)
                }
            }
        }
        return 0
    }

    func insertIndex(_ heap: [(Double, Int)], _ t: Double) -> Int { //O(log n)
        var l = 0, r = heap.endIndex
        while l<r {
            let mid = l+(r-l)>>1
            if heap[mid].0 < t {
                l = mid+1
            } else {
                r = mid
            }
        }
        return l
    }
}