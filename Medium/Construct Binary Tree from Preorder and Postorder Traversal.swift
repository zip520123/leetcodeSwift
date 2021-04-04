//Construct Binary Tree from Preorder and Postorder Traversal

//O(n) O(h)
    func constructFromPrePost(_ pre: [Int], _ post: [Int]) -> TreeNode? {
        var preIndex = 0, map = [Int:Int]()
        for (i,n) in post.enumerated() {
            map[n] = i
        }
        func dfs(_ left: Int, _ right: Int) -> TreeNode? {
            if left > right {return nil}
            let node = TreeNode(pre[preIndex])
            preIndex += 1
            if left == right {return node}
            var postIndex = map[pre[preIndex]]!

            node.left = dfs(left,postIndex)
            node.right = dfs(postIndex+1,right-1)
            return node
        }
        return dfs(0,post.endIndex - 1)
    }

    func constructFromPrePost(_ pre: [Int], _ post: [Int]) -> TreeNode? {
        var preIndex = 0, postIndex = 0
        func dfs() -> TreeNode? {
            let node = TreeNode(pre[preIndex])
            preIndex += 1
            if node.val != post[postIndex] {
                node.left = dfs()
            }
            if node.val != post[postIndex] {
                node.right = dfs()
            }
            postIndex += 1
            return node
        }
        return dfs()
    }