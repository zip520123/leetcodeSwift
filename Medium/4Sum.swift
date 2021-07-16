//4Sum
//O(n^3) O(n)
func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.endIndex < 4 {return []}
        let nums = nums.sorted()
        var res = [[Int]]()
        var i = 0
        while i < nums.endIndex - 3 {
            if i - 1 >= 0 && nums[i] == nums[i - 1] {
                i+=1
                continue
            }
            var j = i + 1
            while j < nums.endIndex - 2 {
                if j - 1 >= i + 1 && nums[j - 1] == nums[j] {
                    j += 1
                    continue
                }
                var k = j + 1, l = nums.endIndex - 1
                while k < l {
                    let sum = nums[i] + nums[j] + nums[k] + nums[l]
                    if sum == target {
                        res.append([nums[i], nums[j], nums[k], nums[l]])
                        while k + 1 < l && nums[k] == nums[k + 1] {
                            k += 1
                        }
                        k += 1
                        while l - 1 > k && nums[l] == nums[l - 1] {
                            l -= 1
                        }
                        l -= 1
                    } else if sum < target {
                        while k + 1 < l && nums[k] == nums[k+1] {
                            k += 1
                        }
                        k += 1
                    } else {
                        while l - 1 > k && nums[l] == nums[l - 1] {
                            l -= 1
                        }
                        l -= 1
                    }
                    
                }
                j+=1
            }
            
            i+=1
        }
        return res
    }


    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.endIndex < 4 {return []}
        var res = [[Int]]()
        let nums = nums.sorted()
        for i in 0..<nums.endIndex-3 {
            if i>0 && nums[i-1] == nums[i] {continue}
            for j in i+1..<nums.endIndex-2 {
                if j > i+1 && nums[j] == nums[j-1] {continue}
                var k = j+1, l = nums.endIndex-1 
                while k<l {
                    let n = nums[i] + nums[j] + nums[k] + nums[l]
                    if n == target {
                        res.append([nums[i], nums[j], nums[k], nums[l]])
                        while k+1<l && nums[k] == nums[k+1] { k+=1 }
                        k += 1
                        while l-1>k && nums[l] == nums[l-1] {l-=1}
                        l-=1
                    } else if n < target {
                        while k+1<l && nums[k] == nums[k+1] { k+=1 }
                        k+=1
                    } else if n > target {
                        while l-1>k && nums[l] == nums[l-1] {l-=1}
                        l-=1
                    }   
                }
                
            }
        }
        return res
    }