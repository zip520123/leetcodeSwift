//Shortest Subarray with Sum at Least K
//O(n), O(n)
    func shortestSubarray(_ nums: [Int], _ k: Int) -> Int {
        var N = nums.endIndex, res = N + 1
        var prefix = [0]+nums
        for i in 1...N {
            prefix[i] += prefix[i-1]
        }

        var queue = [Int]()
        for i in 0...N {
            while !queue.isEmpty && prefix[i] - prefix[queue.first!] >= k {
                res = min(res, i - queue.first!)
                queue.removeFirst()
            }
            while !queue.isEmpty && prefix[i] <= prefix[queue.last!] {
                queue.removeLast()
            }
            queue.append(i)
        }
        return res == N+1 ? -1 : res 
    }