//Unique Binary Search Trees
//O(n^2)
class Solution {
    func numTrees(_ n: Int) -> Int {
        return subTree(1,n)
    }
    func subTree(_ start:Int, _ end:Int) -> Int {
        if start > end {return 1}
        if start == end {return 1}
        var res = 0
        for i in start...end {
            let left = subTree(start,i-1)
            let right = subTree(i+1,end)
            res += left * right
        }
        return res
    }
}
//O(n^2)
class Solution {
    var dict = [[Int]:Int]()
    func numTrees(_ n: Int) -> Int {
        return subTree(1,n)
    }
    
    func subTree(_ start:Int, _ end:Int) -> Int {
        if start > end {return 1}
        if start == end {return 1}
        if dict[[start,end]] != nil {
            return dict[[start,end]]!
        }
        var res = 0
        for i in start...end {
            let left = subTree(start,i-1)
            let right = subTree(i+1,end)
            res += left * right
        }
        dict[[start,end]] = res
        return res
    }
}