// Knight Dialer
// O(n), O(1)
func knightDialer(_ n: Int) -> Int {
    if n == 1 {return 10}
    var n1 = 1, n2 = 1, n3 = 1, n4 = 1, n6 = 1, n7 = 1, n8 = 1, n9 = 1, n0 = 1
    let mod = Int(1E9+7)
    for _ in 1..<n {
        let newN1 = n6+n8 % mod
        let newN2 = n7+n9 % mod
        let newN3 = n4+n8 % mod
        let newN4 = n3+n9+n0 % mod
        let newN6 = n1+n7+n0 % mod
        let newN7 = n2+n6 % mod
        let newN8 = n1+n3 % mod
        let newN9 = n2+n4 % mod
        let newN0 = n4+n6 % mod
        n1 = newN1
        n2 = newN2
        n3 = newN3
        n4 = newN4
        n6 = newN6
        n7 = newN7
        n8 = newN8
        n9 = newN9
        n0 = newN0
    }
    return (n1+n2+n3+n4+n6+n7+n8+n9+n0) % mod
}