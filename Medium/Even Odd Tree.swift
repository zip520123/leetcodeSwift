// Even Odd Tree
// O(n), O(n)
func isEvenOddTree(_ root: TreeNode?) -> Bool {
    guard let node = root else {return true}
    var q = [node]
    var level = -1
    while !q.isEmpty {
        level += 1
        let temp = q
        q = []
        for i in 0..<temp.endIndex-1 {
            if level % 2 == 0 { //even level
                if temp[i].val >= temp[i+1].val {return false} 
            } else { //odd level
                if temp[i].val <= temp[i+1].val {return false}
            }
        }
        for node in temp {
            if level % 2 == 0 { //even level
                if node.val % 2 == 0 {return false} 
            } else { //odd level
                if node.val % 2 != 0 {return false}
            }
            if node.left != nil {q.append(node.left!)}
            if node.right != nil {q.append(node.right!)}
        }
    }
    return true
}