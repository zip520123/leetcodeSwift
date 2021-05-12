//Single-Row Keyboard
//O(n+k), O(k), n = keyboard, k = word
    func calculateTime(_ keyboard: String, _ word: String) -> Int {
        var dict = [Character: Int]()
        for (i,char) in keyboard.enumerated() {
            dict[char] = i
        }
        var res = 0
        var curr = 0
        for char in word {
            res += abs(curr - dict[char]!)
            curr = dict[char]!
        }
        return res
    }