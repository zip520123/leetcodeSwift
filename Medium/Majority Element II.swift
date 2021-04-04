/*Majority Element II*/
// O(n) space O(n)
    func majorityElement(_ nums: [Int]) -> [Int] {
        var dict = [Int:Int]()
        var res = Set<Int>()
        for n in nums {
            dict[n,default:0] += 1
            if dict[n]! > nums.endIndex / 3 {
                res.insert(n)
            }
        }
        
        return Array(res)
    }

//O(n) space O(1)
func majorityElement(_ nums: [Int]) -> [Int] {
        var candidate1 = 0, candidate2 = 1, count1 = 0, count2 = 0
        for n in nums {
            if n == candidate1 {
                count1 += 1
            }else if n == candidate2 {
                count2 += 1
            }else if count1 == 0 {
                candidate1 = n
                count1 = 1
            } else if count2 == 0 {
                candidate2 = n
                count2 = 1
            } else {
                count1 -= 1
                count2 -= 1
            }
        }
        count1 = 0; count2 = 0
        var res = [Int]()
        for n in nums {
            if n == candidate1 {
                count1 += 1
            }
            if n == candidate2 {
                count2 += 1  
            }
        }
        
        if count1 > nums.endIndex / 3 {
            res.append(candidate1)
        }
        if count2 > nums.endIndex / 3 {
            res.append(candidate2)
        }
        return res
    }

// def majorityElement(self, nums):
//     if not nums:
//         return []
//     count1, count2, candidate1, candidate2 = 0, 0, 0, 1
//     for n in nums:
//         if n == candidate1:
//             count1 += 1
//         elif n == candidate2:
//             count2 += 1
//         elif count1 == 0:
//             candidate1, count1 = n, 1
//         elif count2 == 0:
//             candidate2, count2 = n, 1
//         else:
//             count1, count2 = count1 - 1, count2 - 1
//     return [n for n in (candidate1, candidate2)
//                     if nums.count(n) > len(nums) // 3]