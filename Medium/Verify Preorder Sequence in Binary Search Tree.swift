//Verify Preorder Sequence in Binary Search Tree
//O(n) O(n)
    func verifyPreorder(_ preorder: [Int]) -> Bool {
        var currMin = Int.min
        var stack = [Int]()
        for n in preorder {
            if n < currMin {return false}
            while stack.isEmpty == false && stack.last! < n {
                currMin = stack.removeLast()
            }
            stack.append(n)
            
        }
        return true
    }