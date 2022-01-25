//Valid Mountain Array
//O(n), O(1)
    func validMountainArray(_ arr: [Int]) -> Bool {
        if arr.endIndex < 3 {return false}
        
        var index = 0
        var maxN = Int.min
        
        for (i, n) in arr.enumerated() {
            if n > maxN {
                maxN = n
                index = i
            }
        }
        
        if index == arr.endIndex-1 || index == 0 {
            return false
        }
        
        var i = 0
        while i < index {
            if arr[i] >= arr[i+1] {
                return false
            }
            i += 1
        }
        
        while i<arr.endIndex-1 {
            if arr[i] <= arr[i+1] {
                return false
            }
            i += 1
        }
        return true
    }