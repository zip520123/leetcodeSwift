//Nested List Weight Sum
class Solution {
    func depthSum(_ nestedList: [NestedInteger]) -> Int {
        return nestedList.flatMap { unwrap($0,1) }.reduce(0, +)
    }
    
    func unwrap(_ nest: NestedInteger, _ depth: Int) -> Int {
        var res = 0
        if nest.isInteger() {
            res += nest.getInteger() * depth
        } else {
            res += nest.getList().flatMap { unwrap($0, depth+1) }.reduce(0,+)
        }
        return res
    }
}

// O(n), O(n)
func depthSum(_ nestedList: [NestedInteger]) -> Int {
    func dfs(_ node: NestedInteger, _ depth: Int) -> Int {
        if node.isInteger() {
            return node.getInteger() * depth
        }
        var curr = 0
        for subNode in node.getList() {
            curr += dfs(subNode, depth + 1)
        }
        return curr
    }
    return nestedList.reduce(0, { acc, node in acc + dfs(node, 1) })
}

// O(n), O(n)
func depthSum(_ nestedList: [NestedInteger]) -> Int {
    return depthInt(nestedList)   
}

func depthInt(_ nestedInteger: [NestedInteger], _ depth: Int = 1) -> Int {
    var res = 0
    for node in nestedInteger {
        if node.isInteger() {
            res += node.getInteger() * depth
        } else {
            res += depthInt(node.getList(), depth + 1)
        }
    }
    return res
}