// Find Words That Can Be Formed by Characters
// O(n), O(n)
func countCharacters(_ words: [String], _ chars: String) -> Int {
    var res = 0
    var dict = [Character: Int]()
    for char in Array(chars) {
        dict[char, default: 0] += 1
    }
    next: for word in words {
        var curr = dict
        for char in word {
            curr[char, default: 0] -= 1
            if curr[char, default: 0] == -1 {
                continue next
            }
        }
        res += word.count
    }
    return res
}