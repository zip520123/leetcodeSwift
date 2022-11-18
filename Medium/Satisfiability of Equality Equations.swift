//Satisfiability of Equality Equations
//O(n log n), O(n)
    func equationsPossible(_ equations: [String]) -> Bool {
        var dict = [Character: Character]()
        
        func find(_ char: Character) -> Character {
            if dict[char] == nil {
                dict[char] = char
                return char
            }
            if dict[char]! != char {
                dict[char] = find(dict[char]!)
            }
            return dict[char]!
        }
        
        func union(_ char1: Character, _ char2: Character) {
            let root1 = find(char1), root2 = find(char2)
            dict[root1] = root2
        }
        
        for eq in equations {
            let arr = Array(eq)
            let a = arr[0], b = arr[3], op = String(arr[1...2])
            if op == "==" {
                union(a, b)
            }
        }
        
        for eq in equations {
            let arr = Array(eq)
            let a = arr[0], b = arr[3], op = String(arr[1...2])
            if op == "!=" {
                if find(a) == find(b) {
                    return false
                }
            }
        }
        return true
    }