//Minimum Operations to Make Array Equal
//O(n) O(1)
    func minOperations(_ n: Int) -> Int {
        var res = 0
        let avg = 1 + (2 * (n - 1)) / 2
        for i in 0..<n>>1 {
            res += avg - ((2*i)+1)
        }
        return ress
    }
//O(1)
    func minOperations(_ n: Int) -> Int {
        let avgSum = (1 + (2 * (n - 1) + 1)) * n / 4 - ((1 + (2 * (n - 1)>>1) + 1) * n>>1) / 2
        return avgSum 
    }