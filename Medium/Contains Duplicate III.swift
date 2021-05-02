/*Contains Duplicate III*/
//O(n^2) O(1)
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        if k == 0 || nums.endIndex <= 1 {return false}
        for i in 0..<nums.endIndex - 1 {
            for j in i+1..<nums.endIndex {
                if abs(nums[i] - nums[j]) <= t && abs(i - j) <= k {
                    return true
                } 
            }
        }
        return false
    }
//O(n) O(n)
/*Bucket sort, every bucket only have one element, if duplicate return true, check neighbor bucket, if neighbor-n <= t return true, bucket id have to be n/w - (n<0?1:0) to handle n is negative cases. */
class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        var dict = [Int:Int]()
        var w = t+1
        for (i,n) in nums.enumerated() {
            let id = getID(n,w)
            if dict[id] != nil {return true}
            dict[id] = n
            if let prev = dict[id+1], abs(prev-n) <= t {return true}
            if let prev = dict[id-1], abs(prev-n) <= t {return true}
            if i-k >= 0 {
                dict[getID(nums[i-k],w)] = nil
            }
        }
        return false
    }
    func getID(_ n:Int, _ w: Int) -> Int {
        return n/w - (n<0 ? 1:0)
    }
}
//O(n log k) O(n)
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        if nums.endIndex < 2 {return false}
        var indices = [Int](0..<nums.endIndex).sorted {a,b in nums[a]<nums[b]}
        
        for i in 0..<nums.endIndex {
            let x = indices[i]
            for j in i+1..<nums.endIndex {
                let y = indices[j]
                let diffNums = nums[y] - nums[x]
                if diffNums > t {
                    break
                }
                let diffIndex = abs(x-y)
                if diffIndex <= k {
                    return true
                }
            }
        }
        
        return false
    }