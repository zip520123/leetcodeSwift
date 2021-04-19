/*42. Trapping Rain Water

Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.


The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped. Thanks Marcos for contributing this image!

Example:

Input: [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
*/

//brute force time O(n^2) space O(1)
func trap(_ height: [Int]) -> Int {
    if height.endIndex <= 2 {return 0}
    var res = 0
    for i in 1..<height.endIndex - 1 {
        var left = 0
        for j in 0..<i {
            left = max(left,height[j])
        }
        var right = 0
        for j in i+1..<height.endIndex {
            right = max(right,height[j])
        }
        let hei = min(left,right)
        if hei - height[i] > 0 {
            res += (hei - height[i])
        }
        
    }
    return res
}

//dp time O(n) space O(n)
func trap(_ height: [Int]) -> Int {
    if height.endIndex < 3 {return 0}
    var arr1 = [0]
    var arr2 = [Int](repeating:0,count: height.endIndex)
    for i in 1..<height.endIndex {
        arr1.append(max(arr1[i-1], height[i-1]))
    }
    
    for i in (0..<height.endIndex - 1).reversed() {
        let n = max(arr2[i+1],height[i+1])
        arr2[i] = n
    }
    var res = 0
    for i in 0..<height.endIndex {
        let left = arr1[i]
        let right = arr2[i]
        let hei = min(left,right)
        let curr = height[i]
        if hei - curr > 0 {
            res += hei - curr
        }
    }
    return res
}

//stack time O(n) space O(n)
func trap(_ height: [Int]) -> Int {
    var stack = [Int]()
    var curr = 0
    var res = 0 
    while curr < height.endIndex {
        while !stack.isEmpty && height[curr] > height[stack.last!] {
            let top = stack.removeLast()
            if stack.isEmpty {break}
            let distance = curr - stack.last! - 1
            let hei = min(height[curr], height[stack.last!]) - height[top]
            res += distance * hei
        }
        stack.append(curr)
        curr+=1
    }
    
    return res
}

// time O(n) space(1)
class Solution {
    func trap(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1
        var res = 0
        var leftMax = 0, rightMax = 0
        
        while(left<right) {
            if (height[left] < height[right]) {
                if(leftMax < height[left]) {
                    leftMax = height[left]
                } else {
                    res += leftMax - height[left]
                }
                
                left+=1
            } else {
                if(rightMax < height[right]) {
                    rightMax = height[right]
                } else {
                    res += rightMax - height[right]
                }
                right-=1
            }
        }
        
        return res
    }
}

    func trap(_ height: [Int]) -> Int {
        var l = 0, r = height.endIndex - 1
        var res = 0
        var leftMax = 0, rightMax = 0
        while l < r {
            if height[l] < height[r] {
                if height[l] > leftMax {
                    leftMax = height[l]
                } else {
                    res += leftMax - height[l]
                }
                l += 1
            } else {
                if height[r] > rightMax {
                    rightMax = height[r]
                } else {
                    res += rightMax - height[r]
                }
                r -= 1
            }
        }
        return res
    }
let input = [0,1,0,2,1,0,1,3,2,1,2,1]
let output = 6
print(Solution().trap(input) == output)