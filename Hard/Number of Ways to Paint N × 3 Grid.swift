//Number of Ways to Paint N × 3 Grid
    func numOfWays(_ n: Int) -> Int {
        var color2 = 6
        var color3 = 6
        var i = 2
        let mod = Int(1e9+7)
        while i <= n {
            let temp = color3
            color3 = (2*color3 + 2*color2) % mod
            color2 = (2*temp + 3*color2) % mod
            i += 1
        }
        return (color3 + color2) % mod
    }

/*
init: for the single row, there are C(3, 3) * 3! = 6 3-color combinations, and C(3, 2) * 2 = 6 2-color combinations.
C(3, 3) * 3! means: choose 3 colors out of 3, and, first cell: 3 possibilities, second cell: 2 possibilities, third cell: only 1 possibility.
C(3, 2) * 2 means: choose 2 colors out of 3, and, there are only two ways: ABA or BAB.
S(n + 1) = 2 * S(n) + 2 * T(n)
T(n + 1) = 2 * S(n) + 3 * T(n)
*/