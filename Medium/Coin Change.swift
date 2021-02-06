/*Coin Change*/
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    //time O(amount ^ coins) space O(n) TLE
    if amount == 0 {return 0}
    var res = Int.max
    func dfs(_ currAmount: Int, _ count: Int) {
        if currAmount == 0 {
            res = min(res, count)
            return
        }
        for n in coins {
            if currAmount - n >= 0 {
                dfs(currAmount - n, count + 1)
            }
        }
    }
    dfs(amount, 0)
    if res == Int.max {
        return -1
    }
    return res
}

//f(0) = 0
//f(s) = -1 when no coin available
//f(s) = min(each_coin( f(s - c) + 1 )
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var arr = Array<Int>(repeating: 0, count: amount + 1)
    //time O(amount * coins) space O(amount)
    func dfs(_ rest: Int) -> Int {
        if rest == 0 {return 0}
        if arr[rest] != 0 {return arr[rest]}
        var min = Int.max
        for coin in coins {
            let val = rest - coin
            if val >= 0 {
                let res = dfs(val)
                if res != -1 {
                    min = Swift.min(res + 1, min)
                }
            }
        }
        min = min == Int.max ? -1 : min
        arr[rest] = min
        return min
    }
    return dfs(amount)
}

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    if amount < 1 {return 0}
    var arr = Array<Int>(repeating: 0, count: amount)
    
    func dfs(_ rest: Int) -> Int {
        if rest < 0 {return -1}
        if rest == 0 {return 0}
        if arr[rest - 1] != 0 {return arr[rest - 1]}
        var min = Int.max
        for coin in coins {
            let res = dfs(rest - coin)
            if res >= 0 && res < min {
                min = res + 1
            }
        }
        arr[rest - 1] = min == Int.max ? -1 : min
        return arr[rest - 1]
    } 
    
    return dfs(amount)
}

//bottom up
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var arr = Array<Int>(repeating: Int.max, count: amount+1)
    arr[0] = 0
    var i = 1
    while i <= amount {
        for coin in coins {
            if coin <= i && arr[i - coin] != Int.max {
                arr[i] = min(arr[i],arr[i - coin] + 1)
            }
        }
        i+=1
    }
    return arr[amount] == Int.max ? -1 : arr[amount]
}