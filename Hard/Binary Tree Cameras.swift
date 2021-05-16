//Binary Tree Cameras
    // 0: Strict ST; All nodes below this are covered, but not this one
    // 1: Normal ST; All nodes below and incl this are covered - no camera
    // 2: Placed camera; All nodes below this are covered, plus camera here
    //O(n), O(h) [curr node not cover, got cover without camara, camara]
    func minCameraCover(_ root: TreeNode?) -> Int {
        func dfs(_ node: TreeNode?) -> [Int] {
            guard let node = node else {return [0,0,9999]}
            let left = dfs(node.left), right = dfs(node.right)
            let mL = min(left[1], left[2]), mR = min(right[1], right[2])
            let d0 = left[1] + right[1]
            let d1 = min(mL + right[2], mR + left[2])
            let d2 = 1 + min(left[0], mL) + min(right[0], mR)
            return [d0,d1,d2]
            
        }
        let res = dfs(root)
        return min(res[1], res[2])
    }

    func minCameraCover(_ root: TreeNode?) -> Int {
        func dfs(_ node: TreeNode?) -> [Int] {
            guard let node = node else {return [0,0,9999]}
            let left = dfs(node.left), right = dfs(node.right)
            let d1 = left[1] + right[1]
            let d2 = min(left[2] + min(right[1], right[2]), right[2] + min(left[1], left[2]))
            let d3 = min(left[0],left[1],left[2]) + min(right[0], right[1],right[2]) + 1
            return [d1, d2, d3]
        }
        let res = dfs(root)
        return min(res[1], res[2])
    }