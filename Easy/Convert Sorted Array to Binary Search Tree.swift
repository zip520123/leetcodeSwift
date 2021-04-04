//Convert Sorted Array to Binary Search Tree
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        
        func createNode(_ left:Int,_ right: Int) -> TreeNode? {
            if left > right {return nil}
            let mid = (left+right)>>1
            let node = TreeNode(nums[mid])
            node.left = createNode(left, mid-1)
            node.right = createNode(mid+1,right)
            return node
        }
        return createNode(0,nums.endIndex - 1)
    }
    