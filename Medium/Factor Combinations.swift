//Factor Combinations

class Solution {
    func getFactors(_ n: Int) -> [[Int]] {
        var res = [[Int]]()
        func dfs(_ curr: Int, _ path: [Int], _ start: Int) {
            if curr == 1 {
                if path.endIndex > 1 {
                    res.append(path)    
                }
                return
            }
            var n = start
            while n <= curr {
                if curr % n == 0 && curr / n >= 1 { 
                // if curr / n >= 1 && curr % n == 0 { use this line will TLE
                    dfs(curr/n, path + [n], n)
                }
                n += 1
            }
        }
        dfs(n, [], 2)
        return res
    }
}
    //recursive
    func getFactors(_ n: Int) -> [[Int]] {
        var res = [[Int]]()
        func dfs(_ curr: Int, _ path: [Int], _ start: Int) {
            var n = start
            while n*n <= curr {
                if curr % n == 0 { 
                    res.append(path+[n, curr/n])
                    dfs(curr/n, path + [n], n)
                }
                n += 1
            }
        }
        dfs(n, [], 2)
        return res
    }

    func getFactors(_ n: Int) -> [[Int]] {
        func dfs(_ curr: Int, _ path: [Int], _ start: Int, _ res: inout [[Int]]) -> [[Int]] {
            var n = start
            while n*n <= curr {
                if curr % n == 0 { 
                    res.append(path+[n, curr/n])
                    dfs(curr/n, path + [n], n, &res)
                }
                n += 1
            }
            return res
        }
        var res = [[Int]]()
        return dfs(n, [], 2, &res)
    }

    //iterative
    func getFactors(_ n: Int) -> [[Int]] {
        var res = [[Int]]()
        var queue = [(n, [Int](), 2)]
        while !queue.isEmpty {
            let (curr, path, start) = queue.removeFirst()
            var n = start
            while n*n <= curr {
                if curr % n == 0 {
                    res.append(path+[n, curr/n])
                    queue.append((curr/n,path+[n],n))
                }
                n += 1
            }
        }
        return res
    }
/*
def getFactors(self, n):
    def factor(n, i, combi, combis):
        while i * i <= n:
            if n % i == 0:
                combis += combi + [i, n/i],
                factor(n/i, i, combi+[i], combis)
            i += 1
        return combis
    return factor(n, 2, [], [])

    def getFactors(self, n):
    todo, combis = [(n, 2, [])], []
    while todo:
        n, i, combi = todo.pop()
        while i * i <= n:
            if n % i == 0:
                combis += combi + [i, n/i],
                todo += (n/i, i, combi+[i]),
            i += 1
    return combis

*/