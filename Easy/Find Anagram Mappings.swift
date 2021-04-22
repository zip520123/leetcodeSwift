//Find Anagram Mappings
//O(A+B) O(B)
    func anagramMappings(_ A: [Int], _ B: [Int]) -> [Int] {
        var dict = [Int:Int]()
        for (i,n) in B.enumerated() {
            dict[n] = i
        }
        var res = [Int]()
        for n in A {
            res.append(dict[n]!)
        }
        return res
    }

    func anagramMappings(_ A: [Int], _ B: [Int]) -> [Int] {
        var dict = [Int:Int]()
        for (i,n) in B.enumerated() {
            dict[n] = i
        }
        return A.compactMap {dict[$0]}
    }