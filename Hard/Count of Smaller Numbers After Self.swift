//Count of Smaller Numbers After Self
//O(n^2), TLE
    func countSmaller(_ nums: [Int]) -> [Int] {
        var res = [Int]()
        for i in 0..<nums.endIndex {
            var count = 0
            for j in i+1..<nums.endIndex {
                if nums[i] > nums[j] {
                    count += 1
                }
            }
            res.append(count)
        }
        return res
    }
//O(n^2), O(n) 4000 ms
    func countSmaller(_ nums: [Int]) -> [Int] {
        var arr = [Int]()
        var res = [Int]()
        for i in (0..<nums.endIndex).reversed() { //O(n)
             var l = 0, r = arr.endIndex
            while l<r { //O(log n)
                let mid = (l+r)>>1
                if arr[mid] < nums[i] {
                     l = mid + 1
                } else {
                     r = mid 
                }
            }
                res.append(l)
                arr.insert(nums[i], at: l) //O(n)
        }       
        return res.reversed()
    }
    