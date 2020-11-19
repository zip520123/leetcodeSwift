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
    var hcount = height.count
    var res = 0
    var left = 0, right = hcount - 1
    while(left < right) {
        let d = right - left
        let h = min(height[left],height[right])
        let c = d * h
        res = max(res, c)
        
        if height[left] > height[right] {
            right -= 1
        } else {
            left += 1
        }
    }
    return res
}