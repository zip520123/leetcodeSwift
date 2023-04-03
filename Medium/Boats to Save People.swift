//Boats to Save People
//O(n log n), O(n)
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        let arr = people.sorted()
        var i = 0, j = arr.endIndex-1
        var res = 0
        while i<=j {
            res += 1
            if arr[i] + arr[j] <= limit {
                i += 1
            }    
            j -= 1
        }
        return res
    }