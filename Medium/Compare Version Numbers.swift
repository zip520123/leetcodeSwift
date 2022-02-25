//Compare Version Numbers
//O(v1+v2), O(v1+v2)
class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let maxN = max(version1.count, version2.count)
        let v1 = parse(version1, maxN)
        let v2 = parse(version2, maxN)
        
        for i in 0..<maxN {
            if v1[i] < v2[i] {
                return -1
            }
            if v1[i] > v2[i] {
                return 1
            }
        }
        return 0
    }
    
    func parse(_ version: String, _ n: Int) -> [Int] {
        var res = version.split(separator: ".").map {Int($0)!}
        while res.count < n {
            res.append(0)
        }
        return res
    }
}
