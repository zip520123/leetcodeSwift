//Word Pattern
//O(p+s),O(p+s)
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        var dict = [Character: String]()
        let p1 = Array(pattern), p2 = s.split(separator: " ")
        if p1.count != p2.count {return false}
        var seen = Set<String>()
        for (p, t) in zip(p1,p2) {
            let text = String(t)
            if dict[p] == nil {
                if seen.contains(text) {
                    return false
                }
                dict[p] = text
                seen.insert(text)
                
            } else {
                if dict[p]! != text {
                    return false
                }
            }
        }
        return true
    }