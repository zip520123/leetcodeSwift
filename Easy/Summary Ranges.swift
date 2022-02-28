/*Summary Ranges*/
//time O(n) space O(n)
func summaryRanges(_ nums: [Int]) -> [String] {
    if nums.endIndex == 0 {return []}
    var res = [[Int]]()
    var l = 0, r = 1
    while r < nums.endIndex {
        if nums[r] - 1 != nums[r-1] {
            res.append([nums[l],nums[r-1]])
            l = r
            r += 1
        } else {
            r += 1
        }
    }
    res.append([nums[l],nums[r-1]])
    
    return res.map {
        list in
        if list[0] == list[1] {
            return String(list[0])
        } else {
            return "\(list[0])->\(list[1])"
        }
    }
}

//O(n), O(1)
    func summaryRanges(_ nums: [Int]) -> [String] {
        if nums.endIndex == 0 {return []}
        var left = nums[0], right = nums[0]
        var res = [String]()
        for i in 1..<nums.endIndex {
            let n = nums[i]
            if right == n-1 {
                right = n
            } else {
                if left == right {
                    res.append(String(left))
                } else {
                    res.append("\(String(left))->\(String(right))")
                }
                left = n
                right = n
            }
        }
        if left == right {
            res.append(String(left))
        } else {
            res.append("\(String(left))->\(String(right))")
        }
        return res
    }