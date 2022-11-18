// The Number of Weak Characters in the Game
//O(n log n), O(n)
    func numberOfWeakCharacters(_ properties: [[Int]]) -> Int {
        let arr = properties.sorted { a, b in 
                                        if a[0] == b[0] {
                                            return a[1]>b[1]
                                        }
                                     return a[0] < b[0]
                                    }
        var mtn = Int.min, res = 0
        for i in (0..<arr.endIndex).reversed() {
            if arr[i][1] < mtn {
                res += 1
            }
            mtn = max(mtn, arr[i][1])
        }
        return res
    }