// Frequency of the Most Frequent Element
// O(n log n), O(n)
func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
    let arr = nums.sorted()
    var l=0,r=0,res=0,curr=0
    while r<arr.endIndex {
        let t = arr[r]
        curr += arr[r]
        while (r-l+1)*t-curr > k {
            curr -= arr[l]
            l += 1
        }
        res = max(res, r-l+1)
        r += 1
    }
    return res
}