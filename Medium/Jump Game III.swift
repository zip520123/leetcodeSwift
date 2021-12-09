//Jump Game III
//DFS TLE O(n) O(n)
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        if arr[start] == 0 {return true}
        if arr[start] == -1 {return false}
        var arr = arr
        
        if arr[start] + start < arr.endIndex {
            let step = arr[start]
            arr[start] = -1
            let forward = start + step 
            let forwardRes = canReach(arr, forward)
            if forwardRes == true {
                return true
            }
            arr[start] = step
        }
        if start - arr[start] >= 0 {
            let step = arr[start]
            arr[start] = -1
            let backward = start - step
            let backwardRes = canReach(arr, backward)
            if backwardRes == true {
                return true
            }
        }
        return false
    }

//BFS O(n) O(n)
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var queue = [start], set = Set<Int>([start])
        
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            if arr[curr] == 0 {return true}
            let left = curr - arr[curr]
            if left >= 0 && set.contains(left) == false {
                queue.append(left)
                set.insert(left)
            }
            let right = curr + arr[curr]
            if  right < arr.endIndex && set.contains(right) == false {
                queue.append(right)
                set.insert(right)
            }
        }
        return false
    }
//DFS set O(n) O(n)
class Solution {
    var set = Set<Int>()
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        guard start >= 0 && start < arr.endIndex else {return false}
        if arr[start] == 0 {return true}
        
        if set.contains(start) {return false}
        set.insert(start)
        
        let forward = start + arr[start]
        let backward = start - arr[start]
        
        return canReach(arr, forward) || canReach(arr, backward)   
    }
}