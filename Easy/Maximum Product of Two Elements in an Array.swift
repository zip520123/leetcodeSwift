// Maximum Product of Two Elements in an Array
// O(n), O(1)
func maxProduct(_ nums: [Int]) -> Int {
    var a = nums[0]
    var aIndex = 0
    for i in 1..<nums.endIndex {
        if nums[i] > a {
            a = nums[i]
            aIndex = i
        }
    }
    var b = 0
    for i in 0..<nums.endIndex {
        if nums[i] > b && i != aIndex {
            b = nums[i]
        }
    }
    return (a-1)*(b-1)
}