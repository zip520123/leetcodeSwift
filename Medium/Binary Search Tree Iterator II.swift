//Binary Search Tree Iterator II
class BSTIterator {
    var arr = [Int]()
    var index = -1
    init(_ root: TreeNode?) { //O(n)
        func dfs(_ node: TreeNode?) {
            guard let node = node else {return}
            dfs(node.left)
            arr.append(node.val)
            dfs(node.right)
        }
        dfs(root)
        
    }

    func hasNext() -> Bool {
        index+1 < arr.endIndex 
    }

    func next() -> Int {
        index += 1
        let val = arr[index]
        return val
    }

    func hasPrev() -> Bool {
        index-1 >= 0 
    }

    func prev() -> Int {
        index -= 1
        let val = arr[index]
        return val
    }
}

//follow up
class BSTIterator {
    var stack = [TreeNode]()
    var arr = [Int]()
    var last: TreeNode?
    var index = -1
    init(_ root: TreeNode?) {
        last = root
    }

    func hasNext() -> Bool {
        !stack.isEmpty || last != nil || index < arr.endIndex - 1
    }

    func next() -> Int { //O(n)
        index += 1
        if index == arr.endIndex {
            while last != nil {
                stack.append(last!)
                last = last!.left
            }
            let curr = stack.removeLast()
            last = curr.right
            arr.append(curr.val)
        }   
        return arr[index]
    }

    func hasPrev() -> Bool {
        return index > 0
    }

    func prev() -> Int {
        index -= 1
        return arr[index]
    }
}