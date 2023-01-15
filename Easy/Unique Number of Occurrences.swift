//Unique Number of Occurrences
//O(n), O(n)
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        
        var dict = [Int: Int]()
        for n in arr {
            dict[n, default:0] += 1
        }
        
        var set = Set<Int>()
        for count in dict.values {
            if set.contains(count) {
                return false
            }
            set.insert(count)
        }
        return true
    }