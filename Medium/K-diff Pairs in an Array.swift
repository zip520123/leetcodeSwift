//K-diff Pairs in an Array
//O(n), O(n)
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        var res = 0
        var dict = [Int: Int]()
        for n in nums {
            dict[n, default:0] += 1
        }
        
        for (key, val) in dict {
            if k == 0  {
                if val >= 2 {
                    res += 1    
                }
            } else {
                if dict[key+k, default:0] > 0 {
                    res += 1
                } 
                if dict[key-k, default:0] > 0 {
                    res += 1
                }
                dict[key] = 0
            }
        }
        return res
    }