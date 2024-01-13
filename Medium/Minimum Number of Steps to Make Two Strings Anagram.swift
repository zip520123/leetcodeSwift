// Minimum Number of Steps to Make Two Strings Anagram
// O(n), O(n)
func minSteps(_ s: String, _ t: String) -> Int {
    var memo = [Character: Int]()
    for char in s {
        memo[char, default: 0] += 1
    }
    
    for char in t {
        memo[char, default: 0] -= 1
    }

    var res = 0
    for (key, val) in memo {
        res += abs(memo[key, default: 0])
    }
    return res / 2
}