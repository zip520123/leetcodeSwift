//Missing Number In Arithmetic Progression
//O(n) O(1)
    func missingNumber(_ arr: [Int]) -> Int {
        let diff = (arr[0] - arr.last!) / arr.endIndex
        for i in 0..<arr.endIndex - 1 {
            let n = arr[i] - diff
            if arr[i+1] != n {
                return n
            }
        }
        return arr[0]
    }
//O(log n) O(1)
    func missingNumber(_ arr: [Int]) -> Int {
        var diff = (arr.last! - arr.first!) / arr.endIndex
        var l = 0, r = arr.endIndex
        while l < r {
            let mid = (l+r) >> 1
            if arr[mid] == diff * mid + arr.first! {
                l = mid + 1
            } else {
                r = mid 
            }
        }
        return arr[0] + l * diff
    }