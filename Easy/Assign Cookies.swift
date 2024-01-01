// Assign Cookies
// O(n log n), O(g+s)
func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
    let g = g.sorted(), s = s.sorted()
    var i = 0, j = 0, res = 0
    while i<g.endIndex && j<s.endIndex {
        if g[i] <= s[j] { 
            res += 1
            i += 1
        }
        j += 1
    }
    return res
}