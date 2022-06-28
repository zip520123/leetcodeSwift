//Minimum Deletions to Make Character Frequencies Unique
//O(n), O(n)
    func minDeletions(_ s: String) -> Int {
        var dict = [Character: Int]()
        for char in s {
            dict[char, default: 0] += 1
        }
        var valueToCount = [Int: Int]()
        for (_, value) in dict {
            valueToCount[value, default:0] += 1
        }

        var res = 0
        for (key, value) in valueToCount {
            if value > 1 {
                let rest = value - 1
                
                next: for _ in 0..<rest {
                    var curr = key
                    for i in (key-24..<key).reversed() {
                        if i <= 0 {
                            res += curr
                            continue next
                        }
                        curr -= 1
                        res += 1
                        if curr == 0 {
                            continue next
                        }
                        if valueToCount[i, default: 0] == 0 {
                            valueToCount[i] = 1
                            continue next
                        }

                    }
                }
                
            }
        }
        return res
    }