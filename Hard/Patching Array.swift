// Patching Array
//O(n! log n), O(n), TLE
class Solution {
    func minPatches(_ nums: [Int], _ n: Int) -> Int {
        var arr = (1...n).map {$0}
        var res = 0
        var removed = [Int]()
        for n in nums {

            for removedN in removed {
                if let index = bs(arr, removedN+n) {
                    arr.remove(at: index)
                    removed.append(removedN+n)
                }
            }
            if let index = bs(arr,n) {
                arr.remove(at: index)
                removed.append(n)
            }
        }
        while arr.endIndex != 0 {
            let p = arr.first!
            res += 1
            for removedN in removed {
                if let index = bs(arr, removedN+p) {
                    arr.remove(at: index)
                    removed.append(removedN+p)
                }
            }
            arr.removeFirst()
            removed.append(p)
        }
        return res
    }
    
    func bs(_ arr:[Int], _ n: Int) -> Int? {
        var l = 0, r = arr.endIndex-1
        while l<r {
            let mid = (l+(r-l)>>1)
            if arr[mid] < n {
                l = mid+1
            } else {
                r = mid
            }
        }
        if l == arr.endIndex || arr[l] != n {
            return nil
        }
        return l

    }
}

//O(n)
    func minPatches(_ nums: [Int], _ n: Int) -> Int {
        var miss = 1, added = 0, i = 0
        while miss <= n {
            if i < nums.endIndex && nums[i] <= miss {
                miss += nums[i]
                i += 1
            } else {
                miss += miss
                added += 1
            }
        }
        return added
    }