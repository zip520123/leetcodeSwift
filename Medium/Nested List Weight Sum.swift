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