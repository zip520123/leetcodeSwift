//The Skyline Problem
//O(n log n)
class Solution {
    func getSkyline(_ buildings: [[Int]]) -> [[Int]] {
        var startDict = [Int:[Int]]()
        var endDict = [Int:[Int]]()
        var timeline = Set<Int>()
        
        for building in buildings {
            let startPoint = building[0]
            let endPoint = building[1]
            let height = building[2]
            startDict[startPoint,default:[]].append(height) 
            endDict[endPoint,default:[]].append(height)
            timeline.insert(startPoint)
            timeline.insert(endPoint)
        }
        
        var prev = 0
        var sortedArr = [0]
        var res = [[Int]]()
        
        let timelineArr = timeline.sorted()
        for point in timelineArr {
            if startDict[point] != nil {
                for n in startDict[point]! {
                    let index = search(n, sortedArr)
                    sortedArr.insert(n, at: index)
                }   
            }
            if endDict[point] != nil {
                for n in endDict[point]! {
                    let index = search(n, sortedArr)
                    sortedArr.remove(at: index)
                }
                if prev > sortedArr.last! {
                    res.append([point, sortedArr.last!])
                    prev = sortedArr.last!
                }
            }
            
            let curr = sortedArr.last!
            if curr > prev {
                res.append([point, curr])
                prev = curr
            }
        }
        return res
    }
    
    func search(_ n: Int, _ arr: [Int]) -> Int {
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
}

class Solution {
    func getSkyline(_ buildings: [[Int]]) -> [[Int]] {
        var startDict = [Int: [Int]](), endDict = [Int: [Int]]()
        var points = Set<Int>()
        for build in buildings {
            let start = build[0], end = build[1], h = build[2]
            startDict[start, default: []].append(h)
            endDict[end, default:[]].append(h)
            points.insert(start)
            points.insert(end)
        }
        var arr = [0], curr = 0, res = [[Int]]()
        for i in points.sorted() {
            if startDict[i] != nil {
                for start in startDict[i]! {
                    let insertIndex = index(start,arr)
                    arr.insert(start, at: insertIndex)
                }
            }
            if endDict[i] != nil {
                for end in endDict[i]! {
                    let removeIndex = index(end,arr)
                    arr.remove(at: removeIndex)
                }
                if curr > arr.last! {
                    res.append([i, arr.last!])
                    curr = arr.last!
                }
            }
            if arr.last != nil {
               if arr.last! > curr {
                   res.append([i,arr.last!])
               }
                curr = arr.last!
            }
        }
        
        return res
        
    }
    
    func index(_ target: Int, _ arr: [Int]) -> Int {
        var l = 0, r = arr.endIndex
        while l<r {
            let mid = l+(r-l)>>1
            if arr[mid] < target {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return l
    }   
    
}