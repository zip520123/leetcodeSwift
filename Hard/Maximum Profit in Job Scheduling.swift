// Maximum Profit in Job Scheduling
/*
This is swift version from rowe1227
https://leetcode.com/problems/maximum-profit-in-job-scheduling/discuss/918804/Python-Top-Down-and-Bottom-Up-DP-7-lines-each
Approach:
Step 1: Sort start, end and profit according to the start time (some test cases are not sorted - the examples are misleading in this respect)
Step 2: If you choose to take job i skip all jobs that start before job i ends. jump is used to find the index of the first job that starts after job i ends.
Step 3: Take a dynamic programming approach to determine the optimal profit. At each step you can choose:

    i. to take the job for profit[i] + helper(jump[i])
	ii. or to skip the job for helper(i+1)
*/
//O(n log n), O(n), top down dp
    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        let jobs = (0..<startTime.endIndex).map {i in (s: startTime[i], e: endTime[i], p: profit[i])}
                    .sorted { job1, job2 in job1.s < job2.s }

        let jumps = (0..<startTime.endIndex).map { i -> Int in
            var l = i+1, r = startTime.endIndex
            let endTime = jobs[i].e
            while l<r {
                let mid = (l+(r-l)>>1)
                if jobs[mid].s < endTime {
                    l = mid+1
                } else {
                    r = mid
                }
            }
           return l
        }

        var dict = [Int: Int]()
        func dfs(_ i: Int) -> Int {
            if i == startTime.endIndex {return 0}
            if dict[i] != nil {return dict[i]!}
            let res = max(jobs[i].p + dfs(jumps[i]), dfs(i+1))
            dict[i] = res
            return res
        }
        return dfs(0)
    }
    
//O(n log n), O(n), bottom up dp
    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        let jobs = (0..<startTime.endIndex).map {i in (s: startTime[i], e: endTime[i], p: profit[i])}
                    .sorted { job1, job2 in job1.s < job2.s }

        let jumps = (0..<startTime.endIndex).map { i -> Int in
            var l = i+1, r = startTime.endIndex
            let endTime = jobs[i].e
            while l<r {
                let mid = (l+(r-l)>>1)
                if jobs[mid].s < endTime {
                    l = mid+1
                } else {
                    r = mid
                }
            }
           return l
        }

        var dp = (0...startTime.endIndex).map {_ in 0}
        for i in (0..<startTime.endIndex).reversed() {
            dp[i] = max(jobs[i].p + dp[jumps[i]], dp[i+1])
        }
        return dp[0]
    }