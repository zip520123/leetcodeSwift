// Count All Valid Pickup and Delivery Options
//O(n^2), O(n^2)
    func countOrders(_ n: Int) -> Int {
        var dict = [[Int]: Int]()
        
        func dfs(_ unpicked: Int, _ undelivered: Int) -> Int {
            if dict[[unpicked, undelivered]] != nil {return dict[[unpicked, undelivered]]!}
            if unpicked == 0 && undelivered == 0 {return 1}
            if unpicked < 0 || undelivered < 0 || unpicked > undelivered {
                return 0
            }
            var res = unpicked * dfs(unpicked-1, undelivered)
            res %= Int(1E9 + 7)
            
            res += (undelivered - unpicked) * dfs(unpicked, undelivered - 1)
            res %= Int(1E9 + 7)
            dict[[unpicked, undelivered]] = res
            return res
        }

        return dfs(n,n)   
    }

//O(n), O(1)
    func countOrders(_ n: Int) -> Int {
        var res = 1
        for i in 1...n {
            res *= i
            res *= 2*i-1
            res %= Int(1E9+7)
        }
        return res
    }