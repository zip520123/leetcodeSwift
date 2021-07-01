//Gray Code
//O(2^n), O(n)
    func grayCode(_ n: Int) -> [Int] {
        
        func dfs(_ n: Int) -> [String] {
            if n == 0 {return ["0"]}
            if n == 1 {return ["0","1"]}
            let arr = dfs(n-1)
            let addZeroArr = arr.compactMap{ num in "0" + num }
            let addOneArr = arr.reversed().compactMap{ num in "1" + num }
            let res = addZeroArr + addOneArr

            return res    
        }
        
        return dfs(n).compactMap { n in Int(n, radix: 2) }
    }