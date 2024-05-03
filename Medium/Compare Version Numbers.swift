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

// O(n), O(n)
func compareVersion(_ version1: String, _ version2: String) -> Int {
    let arr1 = version1.split(separator: ".").map { Int($0)! }, arr2 = version2.split(separator: ".").map { Int($0)! }
    var l = 0, r = 0
    while l < arr1.endIndex, r < arr2.endIndex {
        if arr1[l] < arr2[r] {
            return -1
        }
        if arr1[l] > arr2[r] {
            return 1
        }
        l += 1
        r += 1
    }
    while l<arr1.endIndex {
        if arr1[l] > 0 { return 1 }
        l += 1
    }
    while r<arr2.endIndex {
        if arr2[r] > 0 {return -1}
        r += 1
    }
    return 0
}