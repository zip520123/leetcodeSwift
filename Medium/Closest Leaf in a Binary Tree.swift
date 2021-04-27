//Closest Leaf in a Binary Tree
//O(n^2) O(n)
func findClosestLeaf(_ root: TreeNode?, _ k: Int) -> Int {
        guard let node = root else { return 0 }
        var leafs = [Int]()
        var graph = [Int:[Int]]()
        var queue : [(TreeNode?, TreeNode)] = [(nil,node)]
        while queue.isEmpty == false {
            let (currParent, currNode) = queue.removeFirst()
            if currParent != nil {
                graph[currNode.val,default:[]].append(currParent!.val)    
            }
            if currNode.left != nil {
                graph[currNode.val,default:[]].append(currNode.left!.val)
                queue.append((currNode,currNode.left!))
            }
            if currNode.right != nil {
                graph[currNode.val,default:[]].append(currNode.right!.val)
                queue.append((currNode,currNode.right!))
            }
            if currNode.left == nil && currNode.right == nil {
                leafs.append(currNode.val)
            }
        }
        
        var distance = Int.max
        var res = 0
        for leaf in leafs {
            var seen = Set<Int>()
            var currDistance = 0
            var queue = [leaf]
            currLoop: while true {
                let temp = queue
                queue.removeAll()
                currDistance += 1
                for node in temp {
                    if node == k {
                        break currLoop
                    }
                    if seen.contains(node) == false {
                        seen.insert(node)
                        queue += graph[node]!
                    }
                }
            }
            if currDistance < distance {
                res = leaf
                distance = currDistance
            }
        }
        
        return res
    }