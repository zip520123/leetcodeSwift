//Valid Triangle Number
//O(n^3), O(n)
    func triangleNumber(_ nums: [Int]) -> Int {
        if nums.endIndex < 3 {return 0}
        var res = 0
        let arr = nums.sorted()
        for i in 0..<arr.endIndex-2 {
            if arr[i] == 0 {continue}
            for j in i+1..<arr.endIndex-1 {
                var k = j+1
                while k<arr.endIndex && arr[i]+arr[j]>arr[k] {
                    k += 1
                }
                res += k-j-1
            }
        }
        return res
    }

//O(n^2), O(n)
    func triangleNumber(_ nums: [Int]) -> Int {
        if nums.endIndex < 3 {return 0}
        var res = 0
        let arr = nums.sorted()
        for i in 0..<arr.endIndex-2 {
            if arr[i] == 0 {continue}
            var k = i+2
            for j in i+1..<arr.endIndex-1 {
                while k<arr.endIndex && arr[i]+arr[j]>arr[k] {
                    k += 1
                }
                res += k-j-1
            }
        }
        return res
    }