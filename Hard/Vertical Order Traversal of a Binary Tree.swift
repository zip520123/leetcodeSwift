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