//Binary Tree Vertical Order Traversal
//O(n log n) O(n), ??
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        var memo = [Int: [Int]]()
        func dfs(_ index: Int, _ node: TreeNode?) {
            guard let node else {return}
            memo[index, default: []].append(node.val)
            dfs(index-1, node.left)
            dfs(index+1, node.right)
        }
        dfs(0, root)
        
        let arr = memo.sorted { a, b in a.key < b.key }.map { $0.value }
        return arr
    }
//O(n log n) O(n)
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        var colDict = [Int:[Int]]()
        var queue = [(root, 0)]
        
        while queue.isEmpty == false {
            let (curr, col) = queue.removeFirst()
            guard let node = curr else {continue}
            colDict[col, default:[]].append(node.val)
            queue.append((node.left, col-1))
            queue.append((node.right, col+1))
        }
        let list = colDict.sorted { $0.key < $1.key }.map {$0.value}
        
        return list
    }

//O(n) O(n)
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {return []}
        var res = [[Int]]()
        var colDict = [Int:[Int]]()
        var queue: [(TreeNode?, Int)] = [(root, 0)]
        var minCol = 0, maxCol = 0
        while queue.isEmpty == false {
            let (curr, col) = queue.removeFirst()
            guard let node = curr else {continue}
            minCol = min(minCol, col)
            maxCol = max(maxCol, col)
            colDict[col, default:[]].append(node.val)
            queue.append((node.left, col-1))
            queue.append((node.right, col+1))
        }
        for i in minCol...maxCol {
            res.append(colDict[i]!)
        }
        return res
    }

// O(n), O(n)
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        var memo = [Int: [Int]]()
        var maxN = 0, minN = 0
        guard let node = root else {return []}
        var queue: [(col: Int, node: TreeNode)] = [(0, node)]
        while !queue.isEmpty {
            let temp = queue
            queue = []
            for curr in temp {   
                memo[curr.col, default: []].append(curr.node.val)
                maxN = max(maxN, curr.col)
                minN = min(minN, curr.col)
                if let left = curr.node.left {
                    queue.append((curr.col-1, left))
                }
                if let right = curr.node.right {
                    queue.append((curr.col+1, right))
                }
            }
        }

        
        var res = [[Int]]()
        for i in minN...maxN {
            res.append(memo[i]!)
        }
        return res
    }