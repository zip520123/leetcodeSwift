//Merge Sorted Array
//O(n log n), O(1)
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        for i in 0..<n {
            nums1[m+i] = nums2[i]
         }
        nums1 = nums1.sorted()
    }

    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        if n == 0 { return }
        if m == 0 {
            nums1 = nums2
            return}
        nums1 = Array(nums1[0..<m])
        
        func mergeSort(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
            var l = 0, r = 0
            var res = [Int]()
            while l < arr1.endIndex && r < arr2.endIndex {
                if arr1[l] < arr2[r] {
                    res.append(arr1[l])
                    l+=1
                } else {
                    res.append(arr2[r])
                    r+=1
                }
            }
            while l < arr1.endIndex {
                res.append(arr1[l])
                l+=1
            }
            while r < arr2.endIndex {
                res.append(arr2[r])
                r += 1
            }
            return res
        }
        nums1 = mergeSort(nums1,nums2)
    }