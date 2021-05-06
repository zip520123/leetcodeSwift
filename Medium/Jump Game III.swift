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
class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var queue = [start], seen = Set<Int>([start])
        
        while !queue.isEmpty {
            let currIndex = queue.removeFirst()
            if arr[currIndex] == 0 {return true}
            let forwardIndex = currIndex + arr[currIndex]
            if forwardIndex < arr.endIndex && seen.contains(forwardIndex) == false {
                queue.append(forwardIndex)
                seen.insert(forwardIndex)
            }
            let backwardIndex = currIndex - arr[currIndex]
            if backwardIndex >= 0 && seen.contains(backwardIndex) == false {
                queue.append(backwardIndex)
                seen.insert(backwardIndex)
            }
        }
        return false
    } 
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