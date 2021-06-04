//Open the Lock
//O(10000*8), O(10000*8) TLE
    func openLock(_ deadends: [String], _ target: String) -> Int {
        if target == "0000" {return 0}
        var graph = [String: [String]]()
        let deadSet = Set(deadends)
        for i in 0...9999 {
            var node = String(i)
            while node.count < 4 {
                node = "0" + node
            }
            if deadSet.contains(node) {continue}
            let sArr = Array(node)
            for i in 0..<node.count {
                let char = sArr[i]
                let n = Int(String(char))!
                var next = n+1 
                if next == 10 {next = 0}
                let nei1 = String(sArr[0..<i]) + String(next) + String(sArr[(i+1)...]) 
                var prev = n-1
                if prev == -1 {prev = 9}
                let nei2 = String(sArr[0..<i]) + String(prev) + String(sArr[(i+1)...]) 
                if !deadSet.contains(nei1) {graph[node, default:[]].append(nei1)}
                if !deadSet.contains(nei2) {graph[node, default:[]].append(nei2)}
            }
        }
        if deadSet.contains("0000") {return -1}
        var queue = ["0000"]
        var seen = Set<String>(["0000"])
        var level = 0
        while !queue.isEmpty {
            let temp = queue
            queue.removeAll()
            level += 1
            for node in temp {
                for nei in graph[node, default:[]] {
                    if nei == target {
                        return level
                    }
                    if !seen.contains(nei) {
                        seen.insert(nei)
                        queue.append(nei)
                    }
                }
            }
        }
        return -1
    }

//bfs one end
    func openLock(_ deadends: [String], _ target: String) -> Int {
        let deadSet = Set(deadends)
        if deadSet.contains("0000") {return -1}
        var queue = ["0000"]
        var seen = Set<String>(["0000"])
        var level = 0
        while !queue.isEmpty {
            let temp = queue
            queue.removeAll()
            
            for node in temp {
                if node == target {return level}
                let nodeArr = Array(node)
                for i in 0..<4 {
                    let n = Int(String(nodeArr[i]))!
                    var next = (n+1) % 10
                    let nei1 = String(nodeArr[0..<i]) + String(next) + String(nodeArr[(i+1)...])
                    if !seen.contains(nei1) && !deadSet.contains(nei1) {
                        seen.insert(nei1)
                        queue.append(nei1)
                    }
					
                    var prev = (n-1+10) % 10
                    let nei2 = String(nodeArr[0..<i]) + String(prev) + String(nodeArr[(i+1)...])
                    if !seen.contains(nei2) && !deadSet.contains(nei2) {
                        seen.insert(nei2)
                        queue.append(nei2)
                    }
                }
            }
            level += 1
        }
        return -1
    }

    //two end
     func openLock(_ deadends: [String], _ target: String) -> Int {
        var deadSet = Set(deadends)
        if deadSet.contains("0000") {return -1}
        
        var level = 0
        var begin = Set(["0000"])
        var end = Set([target])
        while !begin.isEmpty && !end.isEmpty {
            var temp = begin
            begin.removeAll()
            for node in temp {
                if end.contains(node) {return level}
                if deadSet.contains(node) {continue}
                deadSet.insert(node)
                let nodeArr = Array(node)
                for i in 0..<4 {
                    let n = Int(String(nodeArr[i]))!
                    var next = (n+1) % 10
                    let nei1 = String(nodeArr[0..<i]) + String(next) + String(nodeArr[(i+1)...])
                    if !deadSet.contains(nei1) {
                        begin.insert(nei1)
                    }
					
                    var prev = (n-1+10)%10
                    let nei2 = String(nodeArr[0..<i]) + String(prev) + String(nodeArr[(i+1)...])
                    if !deadSet.contains(nei2) {
                        begin.insert(nei2)
                    }
                }
            }
            (begin, end) = (end, begin)
            level += 1
        }
        return -1
    }