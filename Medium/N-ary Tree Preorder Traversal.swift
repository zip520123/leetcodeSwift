//N-ary Tree Preorder Traversal
//O(n) O(h)
    func preorder(_ root: Node?) -> [Int] {
    	guard let node = root else {return []}
        var res = [node.val]
        res += node.children.flatMap { preorder($0) }
        return res
    }
//O(n) O(w)
    func preorder(_ root: Node?) -> [Int] {
    	guard let node = root else {return []}
        var res = [Int]()
        var stack = [node]
        while stack.isEmpty == false {
            let curr = stack.removeFirst()
            res.append(curr.val)
            stack = curr.children + stack
        }
        return res
    }