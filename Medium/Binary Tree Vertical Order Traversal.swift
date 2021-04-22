//Binary Tree Vertical Order Traversal
//O(n log n) O(n)
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        var dict = [Int:[Int:[Int]]]()
        func dfs(_ node: TreeNode?, _ row: Int, _ col: Int) {
            guard let node = node else {return}
            dict[col, default:[:]][row, default:[]].append(node.val)
            dfs(node.left, row + 1, col - 1)
            dfs(node.right, row + 1, col + 1)
        }
        dfs(root,0,0)
        let list = dict.sorted { $0.key < $1.key }
                        .map { $0.value.sorted { $0.key < $1.key }
                              .flatMap { $0.value } }
        return list
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