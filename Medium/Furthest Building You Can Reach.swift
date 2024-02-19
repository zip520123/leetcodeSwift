//Furthest Building You Can Reach
//O(n log n) O(n), TLE
class Solution {
    func furthestBuilding(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
        var i = 0, heap = MinHeap() , bricks = bricks
        while i < heights.endIndex - 1 {
            if heights[i] < heights[i+1] {
                let delta = heights[i+1] - heights[i]
                heap.insert(delta)
                if heap.count() > ladders {
                    let curr = heap.removeMin()
                    bricks -= curr
                    if bricks < 0 {
                        return i
                    }
                }
            }
            i += 1
        }
        return heights.endIndex - 1
    }
//Heap
    class MinHeap {
        var arr: [Int] = []
        func removeMin() -> Int { 
            let res = peek()
            let last = arr.removeLast()
            if arr.endIndex == 0 {
                arr.append(last)
                return last
            }
            arr[0] = last
            
            var i = 0
            var currIndex = 0
           
            while (i*2+1 < arr.endIndex && arr[i] > arr[i*2+1]) || 
            (i*2+2 < arr.endIndex && arr[i] > arr[(i*2)+2]) {
                let left = i*2+1
                let right = i*2+2
                if left < arr.endIndex && arr[i] > arr[left] {
                    i = left
                }
                if right < arr.endIndex && arr[i] > arr[right] { 
                    i = right
                }
                
                (arr[i], arr[currIndex]) = (arr[currIndex], arr[i])
                currIndex = i
            }

            return res
        }
        
        func insert(_ n: Int) {
            arr.append(n)
            var i = arr.endIndex - 1
            while arr[(i - 1) / 2] > arr[i] {
                let parent = (i - 1) / 2
                (arr[parent], arr[i]) = (arr[i], arr[parent])
                i = parent
            }
        }
        
        func peek() -> Int {
            return arr.first ?? -1
        }
        
        func count() -> Int {
            return arr.endIndex
        }
    }
}
// O(n log n) O(n) bineary search
    func furthestBuilding(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
        var arr = [Int](), bricks = bricks
        
        for i in 0..<heights.endIndex - 1{
            if heights[i] < heights[i+1] {
                let delta = heights[i+1] - heights[i]
                var l = 0, r = arr.endIndex 
                while l < r {
                    let mid = (l+r)/2
                    if arr[mid] < delta {
                        l = mid + 1
                    } else {
                        r = mid
                    }
                }
                arr.insert(delta,at:l)
                if arr.endIndex > ladders {
                    bricks -= arr.removeFirst()
                    if bricks < 0 {
                        return i
                    }
                }
            }
            
        }
        return heights.endIndex - 1
    }

// O(n^2), O(n^2), MLE
    func furthestBuilding(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
        let n = heights.endIndex
        var memo = [[Int]: Int]()
        func dfs(_ index: Int, _ b: Int, _ l: Int) -> Int {
            if index == n-1 { return index }
            if memo[[index,b,l]] != nil {return memo[[index, b, l]]!}
            if heights[index] >= heights[index+1] {
                return dfs(index+1, b, l)
            }
            var res = index
            let diff = heights[index+1] - heights[index] 
            if b >= diff {
                res = max(res, dfs(index+1, b - diff, l))
            }
            if l > 0 {
                res = max(res, dfs(index+1, b, l-1))
            }
            memo[[index,b,l]] = res
            return res
        }
        return dfs(0, bricks, ladders)
    }