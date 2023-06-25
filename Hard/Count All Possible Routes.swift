// Count All Possible Routes
// O(n^2*fuel), O(n^2*fuel)
func countRoutes(_ locations: [Int], _ start: Int, _ finish: Int, _ fuel: Int) -> Int {
    var dict = [[Int]: Int]()
    let mod = Int(1E9+7)
    func dfs(_ start: Int, _ fuel: Int) -> Int {
        if dict[[start, fuel]] != nil {
            return dict[[start, fuel]]!
        }

        var curr = 0
        if start == finish {
            curr += 1
        }
        for i in 0..<locations.endIndex where i != start {
            let restFuel = fuel - abs(locations[i] - locations[start]) 
            if restFuel >= 0 {
                curr = (curr + dfs(i, restFuel)) % mod
            }
        }
        dict[[start, fuel]] = curr
        return curr
    }
    return dfs(start, fuel)
}