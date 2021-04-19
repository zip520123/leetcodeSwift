//Maximum Sum Obtained of Any Permutation
//O(n log n) O(n)
    func maxSumRangeQuery(_ nums: [Int], _ requests: [[Int]]) -> Int {
        if nums.endIndex == 0 {return 0}
        var timeline = [Int](repeating: 0, count: nums.endIndex)
        for request in requests {
            let start = request[0]
            let end = request[1]
            timeline[start] += 1
            if end + 1 < timeline.endIndex {
                timeline[end+1] -= 1
            }
        }
        var freqline = [Int](repeating: 0, count: nums.endIndex)
        freqline[0] = timeline[0]
        for i in 1..<freqline.endIndex {
            freqline[i] = freqline[i-1] + timeline[i]
        }
        let sortedNums = nums.sorted()
        freqline = freqline.sorted()
        var res = 0
        
        for (n, freq) in zip(sortedNums, freqline) {
            res += n * freq 
        }
        return res % Int(pow(10,9) + 7)
    }