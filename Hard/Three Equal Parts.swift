//Three Equal Parts
//O(n)
    func threeEqualParts(_ arr: [Int]) -> [Int] {
        var count = 0
        for n in arr {
            count += n
        }
        if count % 3 != 0 {return [-1,-1]}
        let t = count / 3
        if t == 0 { return [0,arr.endIndex-1]}
        var i1 = -1, j1 = -1, i2 = -1, j2 = -1, i3 = -1, j3 = -1
        var su = 0
        for i in 0..<arr.endIndex {
            if arr[i] == 1 {
                su += 1
                if su == 1 {i1 = i}
                if su == t {j1 = i}
                if su == t+1 {i2 = i}
                if su == 2*t {j2 = i}
                if su == 2*t + 1 {i3 = i}
                if su == 3*t {j3 = i}
            }
        }
        let part1 = Array(arr[i1...j1]), part2 = Array(arr[i2...j2]), part3 = Array(arr[i3...j3])
        if part1 != part2 || part2 != part3 {return [-1,-1]}
        let x = i2 - j1 - 1, y = i3 - j2 - 1, z = arr.endIndex - j3 - 1
        if x < z || y < z {return [-1,-1]}
        return [j1+z, j2+z+1]
        
    }