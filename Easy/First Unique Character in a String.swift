//First Unique Character in a String
//O(n), O(n)
    func firstUniqChar(_ s: String) -> Int {
        var dict = [Character: Int]()
        for char in s {
            dict[char, default: 0] += 1
        }
        for (i, char) in Array(s).enumerated() {
            if dict[char, default: 0] == 1 {
                return i
            }
        }
        return -1
    }