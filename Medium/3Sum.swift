/*3Sum*/
//time O(n^2) space O(n)
func threeSum(_ nums: [Int]) -> [[Int]] {
    let nums = nums.sorted()
    let ncount = nums.count
    var res = [[Int]]()
    var i = 0
    var prev = Int.max
    while(i<ncount - 2) {
        var left = i + 1, right = ncount - 1
        let a = nums[i]
        if prev == a {
            i += 1
            continue
        }
        while(left < right) {
            let b = nums[left], c = nums[right]
            let sum = a + b + c
            if sum == 0 {
                res.append([a,b,c])
                while(left + 1 < right && nums[left + 1] == nums[left]) {
                    left += 1
                }
                while(right - 1 > left && nums[right - 1] == nums[right]) {
                    right -= 1
                }
                left += 1
                right -= 1
            } else if sum > 0 {
                right -= 1
            } else {
                left += 1
            }
        }
        prev = a
        i += 1
    }
    return res
}

// let input = [Int]()
// let input = [0]
// let input = [-1,0,1,2,-1,-4]
let input = [0,0,0]
// let input = [-1,-1,-1,0,0,0,0,1,1,1]
print(threeSum(input))