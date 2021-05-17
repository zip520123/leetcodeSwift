/*Maximum Product Subarray*/
//time O(n) space O(2n)
func maxProduct(_ nums: [Int]) -> Int {
    let ncount = nums.count
    if ncount == 0 {return 0}
    var minArr = Array<Int>(repeating: 0, count: ncount)
    var maxArr = Array<Int>(repeating: 0, count: ncount)
    minArr[0] = nums[0]
    maxArr[0] = nums[0]
    var res = nums[0]
    for i in 1..<ncount {
        let n1 = nums[i]
        let n2 = n1 * minArr[i-1]
        let n3 = n1 * maxArr[i-1]
        minArr[i] = min(n1,n2,n3)
        maxArr[i] = max(n1,n2,n3)
        res = max(maxArr[i],res)
    }
    return res
}

//space O(1)
func maxProduct(_ nums: [Int]) -> Int {
    let ncount = nums.count
    if ncount == 0 {return 0}
    
    var minN = nums[0]
    var maxN = nums[0]
    var res = nums[0]
    for i in 1..<ncount {
        let n1 = nums[i]
        let n2 = n1 * minN
        let n3 = n1 * maxN
        minN = min(n1,n2,n3)
        maxN = max(n1,n2,n3)
        res = max(maxN,res)
    }
    return res
}

    func maxProduct(_ nums: [Int]) -> Int {
        var maxN = nums[0]
        var minN = nums[0]
        var i = 1
        var res = maxN
        while i < nums.endIndex {
            let n = nums[i]
            let newMax = max(n, maxN*n, minN*n)
            let newMin = min(n, maxN*n, minN*n)
            res = max(res, newMax)
            maxN = newMax
            minN = newMin
            i += 1
        }
        return res
    }