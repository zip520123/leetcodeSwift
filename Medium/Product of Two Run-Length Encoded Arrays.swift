// Product of Two Run-Length Encoded Arrays
// O(m+n), O(1)
func findRLEArray(_ encoded1: [[Int]], _ encoded2: [[Int]]) -> [[Int]] {
    var res = [[Int]]()
    var i = 0, j = 0, f1 = 0, f2 = 0, a = 0, b = 0
    while i<encoded1.endIndex || j<encoded2.endIndex {
        if f1 == 0 { 
            f1 = encoded1[i][1]
            a = encoded1[i][0]
        }
        if f2 == 0 {
            f2 = encoded2[j][1]
            b = encoded2[j][0]
        }
        let currF = min(f1, f2), p = a*b
        if !res.isEmpty && res.last![0] == p {
            res[res.endIndex-1][1] += currF
        } else {
            res.append([p, currF])
        }
        f1 -= currF
        f2 -= currF
        if f1 == 0 { i += 1 }
        if f2 == 0 { j += 1 }
    }
    return res
}