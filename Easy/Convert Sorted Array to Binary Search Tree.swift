//Convert Sorted Array to Binary Search Tree
//O(n), O(n^2)

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
    
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.endIndex == 0 { return nil }
        let mid = nums.endIndex/2
        let node = TreeNode(nums[mid])
        node.left = sortedArrayToBST(Array(nums[0..<mid]))
        node.right = sortedArrayToBST(Array(nums[(mid+1)...]))
        return node
    }