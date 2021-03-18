/*Longest Consecutive Sequence*/
//sorted time O(n log n) space O(n)
func longestConsecutive(_ nums: [Int]) -> Int {
    let arr = Array(Set(nums)).sorted()
    if arr.endIndex == 0 {return 0}
    if arr.endIndex == 1 {return 1}
    var localMax = 1
    var res = 1
    var prev = arr[0]
    for i in 1..<arr.endIndex {
        let n = arr[i]
        if n - 1 == prev {
            localMax += 1
            res = max(res, localMax)
        } else {
            localMax = 1
        }
        prev = n
    }
    return res
}

//set time O(n) space O(n)
func longestConsecutive(_ nums: [Int]) -> Int {
    var set = Set(nums)
    var res = 0
    for n in set {
        if (set.contains(n - 1) == false) {
            var curr = n
            var count = 1
            while set.contains(curr + 1) {
                curr += 1
                count += 1
            }
            res = max(res, count)
        }
    }
    return res
}