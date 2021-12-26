//K Closest Points to Origin
//O(n log n) O(n)
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        let sorted = points.sorted(by: {
            a,b in
            return (a[0] * a[0] + a[1] * a[1]) < (b[0] * b[0] + b[1] * b[1])
        })
        return Array(sorted[0..<k])
    }
//O(n)~O(n^2), O(1)
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var points = points
        func quickSelect(_ l: Int, _ r: Int) {
            var start = l, end = r
            var left = start
            for i in start..<end {
                if distance(points[i]) < distance(points[end]) {
                    (points[i],points[left]) = (points[left],points[i]) 
                    left += 1
                }
            }
            (points[left],points[end]) = (points[end],points[left])
            if left+1 == k {
                return
            } else if left+1 > k {
                quickSelect(l,left-1)
            } else {
                quickSelect(left+1,r)
            }
        }
        
        func distance(_ point:[Int] ) -> Int {
            return point[0]*point[0] + point[1]*point[1]
        }
        quickSelect(0, points.endIndex-1)
        return Array(points[0..<k])
    }

//O(n^2), O(1)
class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var points = points
        var l = 0, r = points.endIndex-1
        while true {
            
            for i in l..<r {
                if dist(points[i]) < dist(points[r]) {
                    (points[l], points[i]) = (points[i], points[l])
                    l += 1
                }
            }
            (points[l], points[r]) = (points[r], points[l])
            
            if l+1 > k {
                r = l-1
                l = 0
            } else if l+1 < k {
                l+=1
            } else {
                break
            }
        }
        return Array(points[0..<k])
    }
    
    func dist(_ p1:[Int]) -> Int {
        p1[0]*p1[0]+p1[1]*p1[1]
    }
}