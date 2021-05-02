//Kill Process
//O(n) O(n)
    func killProcess(_ pid: [Int], _ ppid: [Int], _ kill: Int) -> [Int] {
        var graph = [Int:[Int]]()
        
        for (node, parent) in zip(pid,ppid) {
            graph[parent, default:[]].append(node)
        }
        var res = [Int]()
        var queue = [kill]
        while queue.isEmpty == false {
            let node = queue.removeFirst()
            res.append(node)
            for child in graph[node, default:[]] {
                queue.append(child)
            }
        }
        return res
    }