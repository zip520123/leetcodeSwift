/*Intersection of Two Arrays II*/
// O(nums1 logn + nums2 log n) space O(nums1 + nums2)
func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    if nums1.endIndex == 0 || nums2.endIndex == 0 {return []}
    let arr1 = nums1.sorted(by:<) 
    let arr2 = nums2.sorted(by:<) 
    var l = 0, r = 0
    var res = [Int]()
    while l < arr1.endIndex && r < arr2.endIndex {
        if arr1[l] == arr2[r] {
            res.append(arr1[l])
            l += 1
            r += 1
        } else if arr1[l] < arr2[r] {
            l += 1
        } else {
            r += 1
        }
    }
    return res
}
//O(nums1+nums2) O(nums1)
func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var dict = [Int:Int]()
    for n in nums1 {
        dict[n,default:0] += 1
    }
    var res = [Int]()
    for n in nums2 {
        if dict[n,default:0] > 0 {
            res.append(n)
            dict[n]! -= 1
        }
    }
    return res
}