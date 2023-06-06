// Can Make Arithmetic Progression From Sequence
//O(n log n), O(n)
    func canMakeArithmeticProgression(_ arr: [Int]) -> Bool {
        let arr = arr.sorted()
        let d = arr[0]-arr[1]
        for i in 0..<arr.endIndex-1 {
            if arr[i]-arr[i+1] != d {
                return false
            }
        }
        return true
    }