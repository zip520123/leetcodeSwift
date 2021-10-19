//Cousins in Binary Tree
//O(n), O(n)
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        
        var d1: Int?, d2: Int?
        var parent1: TreeNode?, parent2: TreeNode?
        func dfs(_ node: TreeNode?, _ d: Int = 0) {
            guard let node = node else {return}
            if let leftNode = node.left {
                if leftNode.val == x {
                    parent1 = node
                    d1 = d
                } else if leftNode.val == y {
                    parent2 = node
                    d2 = d
                }
                                
            }
            if let rightNode = node.right {
                if rightNode.val == y {
                    parent2 = node
                    d2 = d
                } else if rightNode.val == x {
                    parent1 = node
                    d1 = d
                }
            }
            dfs(node.left, d+1)
            dfs(node.right, d+1)
        }
        dfs(root)
        if let rootNode = root {
            if rootNode.val == x {
                d1 = -1
            } else if rootNode.val == y {
                d2 = -1
            }
        }
        
        return d1! == d2! && parent1 !== parent2
    }