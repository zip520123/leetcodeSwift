/*42. Trapping Rain Water

Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.


The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped. Thanks Marcos for contributing this image!

Example:

Input: [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
*/

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