//First Missing Positive
//O(n) O(n)
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var set = Set<Int>(nums)
        var i = 1
        while i <= nums.endIndex {
            if set.contains(i) == false {
                return i
            }
            i += 1
        }
        return i
    }

    //O(n) O(1)
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        var hasOne = false
        for i in 0..<nums.endIndex {
            let n = nums[i]
            if n == 1 {
                hasOne = true
            }
            if n <= 0 || n > nums.endIndex{
                nums[i] = 1
            }
        }
        if hasOne == false {return 1}
        for i in 0..<nums.endIndex {
            let index = abs(nums[i] % nums.endIndex)
            nums[index] = -abs(nums[index])
        }
        
        var i = 1
        while i < nums.endIndex {
            if nums[i] > 0 {
                return i
            }
            i += 1
        }
        if nums[0] > 0 {
            return nums.endIndex
        }
        return nums.endIndex + 1
    }
// class Solution
// {
// public:
//     int firstMissingPositive(int A[], int n)
//     {
//         for(int i = 0; i < n; ++ i)
//             while(A[i] > 0 && A[i] <= n && A[A[i] - 1] != A[i])
//                 swap(A[i], A[A[i] - 1]);
        
//         for(int i = 0; i < n; ++ i)
//             if(A[i] != i + 1)
//                 return i + 1;
        
//         return n + 1;
//     }
// };