//Minimum Score of a Path Between Two Cities
//O(n),O(n)
class Solution {
    func minScore(_ n: Int, _ roads: [[Int]]) -> Int {
        var dict = [Int: [(Int, Int)]]()
        for road in roads {
            let node1 = road[0], node2 = road[1], d = road[2]
            dict[node1, default:[]].append((node2,d))
            dict[node2, default:[]].append((node1,d))
        }
        var seen = Set<Int>()
        var queue = [1], res = Int.max
        while !queue.isEmpty {
            let temp = queue
            queue.removeAll()
            for node in temp {
                if seen.contains(node) {continue}
                seen.insert(node)
                for next in dict[node, default:[]] {
                    let (nextNode, distance) = next
                    res = min(res, distance)
                    queue.append(nextNode)
                }
            }
        }
        return res
    }
}