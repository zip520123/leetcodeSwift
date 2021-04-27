//Furthest Building You Can Reach
//O(n log n) O(n)
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