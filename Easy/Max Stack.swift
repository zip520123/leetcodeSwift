//Max Stack
class MaxStack {
    var stack = [Int]()
    var arr = [Int]()
    func search(_ n: Int) -> Int { 
        var l = 0, r = arr.endIndex
        while l < r {
            let mid = (l+r)>>1
            if arr[mid] < n {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return l
    }
    
    func push(_ x: Int) { // O(log n)
        stack.append(x)
        let index = search(x)
        arr.insert(x, at:index)
    }
    
    func pop() -> Int { // O(log n)
        guard let curr = stack.last else {return -1}
        stack.removeLast()
        let index = search(curr)
        arr.remove(at:index)
        return curr
    }
    
    func top() -> Int { //O(1)
        stack.last ?? -1
    }
    
    func peekMax() -> Int { //O(1)
        arr.last ?? -1
    }
    
    func popMax() -> Int { //O(n)
        guard let curr = arr.last else {return -1}
        arr.removeLast()
        for i in (0..<stack.endIndex).reversed() {
            if stack[i] == curr {
                stack.remove(at: i)
                break
            }
        }
        return curr
    }
}