//Maximum Length of a Concatenated String with Unique Characters
//O(2^n), O(n!)
    func maxLength(_ arr: [String]) -> Int {
        var dp = [Set<Character>()]
        for s in arr {
            if Set(s).count < s.count {continue}
            let set = Set(s)
            for c in dp {
                if !set.isDisjoint(with: c) {continue}
                dp.append(set.union(c))
            }
        }
        
        return dp.map { $0.count }.max()!
    }

func maxLength(_ arr: [String]) -> Int {
    var dp = [Set<Character>()]
    for s in arr {
        let curr_set = Set(s)
        if curr_set.count < s.count {continue}
        
        for group in dp {
            if group.isDisjoint(with: curr_set) {
                dp.append(group.union(curr_set))
            }
        }
    }
    return dp.map { $0.count }.max()!
}