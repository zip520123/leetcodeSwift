// Fair Distribution of Cookies
// O(k^n), O(k+n)
    func distributeCookies(_ cookies: [Int], _ k: Int) -> Int {
        var res = Int.max
        var arr = (0..<k).map {_ in 0 }

        func dfs(_ index: Int) {
            if index == cookies.endIndex {
                var curr = 0
                for n in arr {
                    if n == 0 {
                        return
                    }
                    curr = max(curr, n)
                }
                res = min(res, curr)
                return
            }
            for j in 0..<k {
                arr[j] += cookies[index]
                dfs(index+1)
                arr[j] -= cookies[index]
            }
        }
        dfs(0)
        return res
    }

// O(k^n), O(k+n)
    func distributeCookies(_ cookies: [Int], _ k: Int) -> Int {
        var arr = (0..<k).map {_ in 0 }
        func dfs(_ index: Int) -> Int {    
            if index == cookies.endIndex {
                var curr = 0
                for n in arr {
                    if n == 0 {
                        return Int.max
                    }
                    curr = max(curr, n)
                }
                return curr
            }

            var res = Int.max
            for j in 0..<k {
                arr[j] += cookies[index]
                res = min(res, dfs(index+1)) 
                arr[j] -= cookies[index]
            }
            return res
        }
        
        return dfs(0)
    }

//O(k^n), O(k+n)
class Solution {
    func distributeCookies(_ cookies: [Int], _ k: Int) -> Int {
        var arr = (0..<k).map {_ in 0 }
        func dfs(_ index: Int) -> Int {    
            if index == cookies.endIndex {
                return arr.max()!
            }

            var res = Int.max
            for j in 0..<k {
                if cookies.endIndex - index-1 < k-j-1 { continue }
                arr[j] += cookies[index]
                res = min(res, dfs(index+1)) 
                arr[j] -= cookies[index]
            }
            return res
        }
        
        return dfs(0)
    }
}
