//Similar String Groups
//O(strs.len^2 * str), O(strs.len)
    func numSimilarGroups(_ strs: [String]) -> Int {
        var dict = [String: String]()
        for s in strs {
            dict[s] = s
        }

        func find(_ node: String) -> String {
            if dict[node] == node {
                return dict[node]!
            }
            let root = dict[node]!
            dict[node] = find(root)
            return dict[node]!
        }

        func union(_ node1: String, _ node2: String) {
            let root1 = find(node1), root2 = find(node2)
            dict[root1] = root2
        }

        func isSimilar(_ s1: String, _ s2: String) -> Bool {
            let arr1 = Array(s1), arr2 = Array(s2)
            var count = 0
            for (char1, char2) in zip(arr1,arr2) {
                if char1 != char2 {
                    count += 1
                }
            }
            return count == 0 || count == 2
        }

        for i in 0..<strs.endIndex-1 {
            for j in i+1..<strs.endIndex {
                if isSimilar(strs[i], strs[j]) {
                    union(strs[i], strs[j])
                } 
            }
        }
        var set = Set<String>()
        for s in strs {
            let root = find(s)
            set.insert(root)
        }
        return set.count
    }