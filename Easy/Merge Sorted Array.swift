//Merge Sorted Array
//O(n log n), O(1)
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        for i in 0..<n {
            nums1[m+i] = nums2[i]
         }
        nums1 = nums1.sorted()
    }