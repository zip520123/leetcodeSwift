//Validate Binary Tree Nodes
//O(n+e), O(n), e = edges, n = node.len
    func validateBinaryTreeNodes(_ n: Int, _ leftChild: [Int], _ rightChild: [Int]) -> Bool {
        var dict = [Int: Int]()
        for i in 0..<n {
            dict[i] = i
        }
        func find(_ node: Int) -> Int {
            if dict[node]! == node {return node}
            let root = find(dict[node]!)
            dict[node]! = root
            return root
        }
        
        func union(_ node1: Int, _ node2: Int) {
            let root1 = find(node1), root2 = find(node2)
            dict[root1] = root2
        }

        for i in 0..<n {
            let left = leftChild[i], right = rightChild[i]
            if left != -1 {
                union(left, i)
            }
            if right != -1 {
                union(right, i)
            }
        }
        
        var set = Set<Int>()
        let root = find(0)
        set.insert(root)
        var queue = [root]
        while !queue.isEmpty {
            let node = queue.removeFirst()
            let left = leftChild[node]
            
            if left != -1 {
                if set.contains(left) {return false}
                set.insert(left)
                queue.append(left)
            }
            let right = rightChild[node]
            if right != -1 {
                if set.contains(right) {return false}
                set.insert(right)
                queue.append(right)
            }
        }
        
        for i in 0..<n {
            if !set.contains(i) {
                return false
            }
        }
        return true
    }