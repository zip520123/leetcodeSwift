//Vertical Order Traversal of a Binary Tree
class Solution {
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        var dict = [Int:[Int:[Int]]]()
        
        func dfs(_ node:TreeNode?, _ col: Int, _ row: Int) {
            guard let node = node else {return}
            dict[col, default:[:]][row, default:[]].append(node.val)
            dfs(node.left, col - 1, row + 1)
            dfs(node.right, col + 1, row + 1)
        }
        
        dfs(root,0,0)
        let list = dict.sorted { $0.key < $1.key }
        .map {
            $0.value.sorted { $0.key < $1.key }
                .flatMap {
                    $0.value.sorted()
                }
        }
        return list
    }
}

    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        var dict = [Int:[Int:[Int]]]()
        
        func dfs(_ node:TreeNode?, _ col: Int, _ row: Int) {
            guard let node = node else {return}
            dict[col, default:[:]][row, default:[]].append(node.val)
            dfs(node.left, col - 1, row + 1)
            dfs(node.right, col + 1, row + 1)
        }
        
        dfs(root,0,0)
        
        let list = dict.sorted {$0.key < $1.key}
            .map {
                $0.value.sorted {$0.key < $1.key}
                    .flatMap {$0.value.sorted()}
            }
            
        return list
    }

    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        
        var dict = [Int:[Int:[Int]]]()
        
        func dfs(_ row: Int, _ col: Int, _ node: TreeNode?) {
            guard let node = node else {return}
            dict[col, default:[:]][row, default:[]].append(node.val)
            dfs(row+1, col-1, node.left)
            dfs(row+1, col+1, node.right)
        }
        dfs(0,0, root)
        let list = dict.sorted { $0.key < $1.key }.map { $0.value }
                    .map { $0.sorted { $0.key < $1.key }
                           .flatMap {$0.value.sorted()}
                         }
        return list
    }

//BFS O(n), O(n)
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        var dict = [[Int]:[Int]]()
        var deep = 0, left = 0, right = 0
        guard let node = root else {return []}
        var queue = [(node: node, index: 0)]
        
        while !queue.isEmpty {
            let temp = queue
            queue.removeAll()
            for item in temp {
                let node = item.node, index = item.index
                left = min(left, index)
                right = max(right, index)
                dict[[deep,index], default: []].append(node.val)
                node.left.flatMap {
                    queue.append(($0, index-1))
                }
                node.right.flatMap {
                    queue.append(($0, index+1))
                }
            }
            deep += 1
        }
        
        var res = [[Int]]()
        for x in left...right {
            var curr = [Int]()
            for y in 0..<deep {
                curr += dict[[y,x], default:[]].sorted()
            }
            res.append(curr)
        }
        return res
    }