/*Median of Two Sorted Arrays*/
//time O(n+m) space O(n+m)
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var i = 0
    var j = 0
    var arr = [Int]()
    while i < nums1.endIndex && j < nums2.endIndex {
        if nums1[i] < nums2[j] {
            arr.append(nums1[i])
            i += 1
        } else {
            arr.append(nums2[j])
            j+=1
        }
    }
    
    while i < nums1.endIndex {
        arr.append(nums1[i])
        i+=1
    }
    while j < nums2.endIndex {
        arr.append(nums2[j])
        j+=1
    }
    if arr.endIndex % 2 == 1 {
        return Double(arr[arr.endIndex >> 1])
    } else {
        let n1 = Double(arr[arr.endIndex >> 1])
        let n2 = Double(arr[arr.endIndex >> 1 - 1])
        return (n1 + n2) / 2
    }
}