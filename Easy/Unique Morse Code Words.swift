//Unique Morse Code Words
//O(n), O(n)
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        let dict: [Character: String] = ["a":".-",
                   "b":"-...",
                   "c":"-.-.",
                   "d":"-..",
                   "e":".",
                   "f":"..-.",
                   "g":"--.",
                   "h":"....",
                   "i":"..",
                   "j":".---",
                   "k":"-.-",
                   "l":".-..",
                   "m":"--",
                   "n":"-.",
                   "o":"---",
                   "p":".--.",
                   "q":"--.-",
                   "r":".-.",
                   "s":"...",
                   "t":"-",
                   "u":"..-",
                   "v":"...-",
                   "w":".--",
                   "x":"-..-",
                   "y":"-.--",
                   "z":"--.."]
        var set = Set<String>()
        for word in words {
            var curr = ""
            for char in word {
                curr += dict[char]!
            }
            set.insert(curr)
        }
        return set.count
    }