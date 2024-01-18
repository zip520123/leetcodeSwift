/*Climbing Stairs*/
//time O(2^n) space O(2^n)
func climbStairs(_ n: Int) -> Int {
    if n == 1 {return 1}
    if n == 2 {return 2}
    return climbStairs(n-1) + climbStairs(n-2)
}
//time O(n) space O(1)
func climbStairs(_ n: Int) -> Int {
    if n == 1 {return 1}
    if n == 2 {return 2}
    var a = 1
    var b = 2
    var res = 0
    for _ in 3...n {
        res = a + b
        a = b
        b = res
        
    }
    return res
}
//O(n), O(1)
func climbStairs(_ n: Int) -> Int {
    if n == 1 {return 1}
    if n == 2 {return 2}
    var a = 1, b = 2
    for _ in 3...n {
        let temp = a
        a = b
        b = temp + b
    }
    return b
}
//O(n),O(1)
func climbStairs(_ n: Int) -> Int {
    if n == 1 {return 1}
    if n == 2 {return 2}
    var a = 1, b = 2
    for _ in 2..<n {
        let t = a+b
        a = b
        b = t
    }
    return b
}
//time O(n) space O(n)
func climbStairs(_ n: Int) -> Int {
    var dict = Dictionary<Int,Int>()

    func dfs(_ n: Int) -> Int {
        if n == 1 {return 1}
        if n == 2 {return 2}
        if dict[n] == nil {
            dict[n] = dfs(n - 1) + dfs(n - 2)
        } 
        return dict[n]!
    } 

    return dfs(n)
}

//O(n), O(n)
func climbStairs(_ n: Int) -> Int {
    var arr = [0,1,2]
    arr[1] = 1
    arr[2] = 2
    var i = 3
    while i <= n {
        arr.append(arr[i-1]+arr[i-2])
        i += 1
    }
    return arr[n]
}

// O(n), O(n)
func climbStairs(_ n: Int) -> Int {
    if n == 1 {return 1}
    var arr = [1,1]
    for i in 2...n {
        arr.append(arr[i-1]+arr[i-2])
    }
    return arr[n]
}