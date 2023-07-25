// Peak Index in a Mountain Array
// O(log n)
func peakIndexInMountainArray(_ arr: [Int]) -> Int {
    var l = 0, r = arr.endIndex-1
    while l<r {
        let mid = l+((r-l)>>1)
        if arr[mid] < arr[mid+1] {
            l = mid+1
        } else {
            r = mid
        }
    }
    return l
}