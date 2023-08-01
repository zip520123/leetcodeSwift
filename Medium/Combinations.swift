//Combinations
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var res = [[Int]]()
        func dfs(_ path:[Int], _ i: Int) {
            if path.endIndex == k {
                res.append(path)
                return
            }
            if i > n {return}
            dfs(path+[i],i+1)
            dfs(path, i+1)
        }
        dfs([], 1)
        return res
    }

    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var res = [[Int]]()
        func dfs(_ path:[Int], _ i: Int) {
            if path.endIndex == k {
                res.append(path)
                return
            }
            var curr = i
            while curr <= n {
                dfs(path+[curr], curr+1)
                curr += 1
            }
        }
        dfs([], 1)
        return res
    }

// O(n^k), O(n^k)
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var res = [[Int]]()
        func dfs(_ curr: [Int], _ currN: Int) {
            if curr.endIndex == k {
                res.append(curr)
                return
            }
            guard currN <= n else {return}
            for i in currN...n {
                dfs(curr+[i], i+1)
            }
        }

        dfs([], 1)
        return res
    }

    /* kami
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var res = [[Int]]()
        guard n > 0, k > 0, n >= k else {return res}
        var i = n
        while i > 0 {
            if k == 1 {
                res.append([i])
            } else {
                for list in combine(i-1, k-1) {
                    res.append([i] + list)
                }
            }
            i -= 1
        }
        return res
    }
    */