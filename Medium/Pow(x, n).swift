//Pow(x, n)
// O(log n), O(log n)
func myPow(_ x: Double, _ n: Int) -> Double {
    if n == 0 {return 1}
    if n < 0 { return myPow(1/x, -n) }
    if n % 2 == 0 {
        return myPow(x*x, n/2)
    }
    return myPow(x,n-1)*x
}

//TLE O(n), O(n)
func myPow(_ x: Double, _ n: Int) -> Double {
    if n == 0 {return 1}
    if n == 1 {return x}
    if n < 0 && x != 0 {
        return myPow(1/x, -n)
    }
    return myPow(x, n-1) * x
}

// O(log n), O(1)
func myPow(_ x: Double, _ n: Int) -> Double {
    if n == 0 {return 1}
    
    var n = n, x = x
    if n < 0 { 
        n = -n
        x = 1/x
    }
    var res: Double = 1
    while n != 0 {
        if n % 2 == 0 {
            n /= 2
            x *= x
        }
        res *= x
        n -= 1
    }
    return res
}