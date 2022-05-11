//Count Sorted Vowel Strings
//O(2^n), O(2^n) TLE
    func countVowelStrings(_ n: Int) -> Int {
        var queue = [[""]]
        for i in 0..<n {
            let temp = queue
            queue.removeAll()
            for node in temp {
                for char in "aeiou" {
                    if node.last! <= String(char) {
                        queue.append(node+[String(char)])
                    }
                }    
            }
            
        }
        return queue.count
    }

//O(nk), O(nk)
    func countVowelStrings(_ n: Int) -> Int {
        var seen = [[Int]: Int]()
        func dfs(_ n: Int, _ k: Int) -> Int {
            if n==1 || k==1 {return k}
            if seen[[n,k]] != nil {
                return seen[[n,k]]!
            }
            
            for nextK in 1...k {
                seen[[n,k], default: 0] += dfs(n-1, nextK)     
            }
            return seen[[n,k]]!
        }
        return dfs(n,5)
    }