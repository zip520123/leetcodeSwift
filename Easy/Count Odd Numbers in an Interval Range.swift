//Count Odd Numbers in an Interval Range
//O(1), O(1)
    func countOdds(_ low: Int, _ high: Int) -> Int {
        var low = low
        if low % 2 == 0 {
            low += 1
        }
        return low > high ? 0 : (high-low)/2+1
    }