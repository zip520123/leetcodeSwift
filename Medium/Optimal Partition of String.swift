//Optimal Partition of String
//O(n), O(n)
    func partitionString(_ s: String) -> Int {
        var set = Set<Character>()
        var res = 1
        for char in s {
            if set.contains(char) {
                res += 1
                set.removeAll()
            }
            set.insert(char)
        }
        return res
    }