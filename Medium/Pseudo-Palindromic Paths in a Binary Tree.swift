/*Pseudo-Palindromic Paths in a Binary Tree*/
// O(n), O(h)
func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
    if root == nil {return 0}
    var res = 0
    func dfs(_ node: TreeNode, _ curr: [Int]) {
        var curr = curr
        curr[node.val]+=1
        if node.left == nil && node.right == nil {
            var hasOdd = false
            for n in curr {
                if n % 2 == 1 {
                    if hasOdd == true {
                        return 
                    } else {
                        hasOdd = true
                    }
                }
            }
            res += 1
            return 
        }   
        
        if let left = node.left {
            dfs(left, curr)
        }
        if let right = node.right {
            dfs(right,curr)
        }
        curr[node.val]-=1
    }
    
    dfs(root!,Array<Int>(repeating: 0, count: 10))
    
    return res
}

//O(n), O(h)
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        guard let root = root else {return 0}
        var res = 0
        func dfs(_ node: TreeNode, _ dict: [Int: Int]) {
            var dict = dict
            dict[node.val, default: 0] += 1
            if node.left == nil && node.right == nil {
                var odd = 0
                for (key, val) in dict {
                    if val % 2 == 1 {
                        if odd == 0 {
                            odd += 1
                        } else {
                            return
                        }
                    }
                }
                res += 1
            } else {
                if let left = node.left {
                    dfs(left, dict)    
                }
                if let right = node.right {
                    dfs(right, dict)
                }
            }
        }
        
        dfs(root, [:])
        return res
    }

// O(n), O(h), MTE
class Solution {
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        var res = 0
        func dfs(_ node: TreeNode?, _ path: [Int]) {
            guard let node else {return}
            let currPath = path + [node.val]
            if node.left == nil, node.right == nil {
                if Self.isPalindrome(currPath) {
                    res += 1
                }
                return
            }
            dfs(node.left, currPath)
            dfs(node.right, currPath)
        }
        dfs(root, [])
        return res
    }

    private static func isPalindrome(_ arr: [Int]) -> Bool {
        var memo = [Int: Int]()
        for n in arr {
            memo[n, default: 0] += 1
        }
        var odd = 0
        for (_, val) in memo {
            if val % 2 == 1 {
                odd += 1
            }
        }
        return odd <= 1
    }
}

// O(n), O(w), BFS
class Solution {
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        var res = 0
        guard let root else {return 0}
        var queue: [(path: [Int: Int], node: TreeNode)] = [(path: [:], node: root)]
        while !queue.isEmpty {
            let temp = queue
            queue = []
            for touple in temp {
                var currPath = touple.path
                var currNode = touple.node
                currPath[currNode.val, default: 0] += 1
                if currNode.left == nil, currNode.right == nil {
                    if Self.isPalindrome(currPath) { res += 1 }
                } 
                if let left = currNode.left { queue.append((currPath, left))}
                if let right = currNode.right {queue.append((currPath, right))}
            }
        }
        return res
    }

    private static func isPalindrome(_ memo: [Int: Int]) -> Bool {
        var odd = 0
        for (_, val) in memo {
            if val % 2 == 1 {
                odd += 1
            }
        }
        return odd <= 1
    }
}