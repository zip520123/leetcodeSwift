// Find Smallest Letter Greater Than Target
//O(n), O(1)
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        var res: Character?
        for char in letters {
            if char > target {
                if let curr = res {
                    if char < curr {
                        res = char
                    }
                } else {
                    res = char
                }
                
            }
        }
        return res ?? letters[0]
    }