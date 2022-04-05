/* Container With Most Water*/
//time O(n^2) space O(1)
func maxArea(_ height: [Int]) -> Int {
    var hcount = height.count
    var res = 0
    for i in 0..<hcount-1 {
        for j in i + 1..<hcount {
            let r = min(height[i],height[j])
            res = max(res, r * (j - i))
        }
    }
    
    return res
}
//time O(n) space O(1)
func maxArea(_ height: [Int]) -> Int {
    var l = 0, r = height.endIndex-1, res = 0
    while l<r {
        let curr = min(height[l], height[r]) * (r-l)
        res = max(res,curr)
        if height[l] < height[r] {
            l += 1
        } else {
            r -= 1
        }
    }
    return res
}