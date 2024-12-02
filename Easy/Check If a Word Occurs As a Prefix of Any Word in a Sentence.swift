// Check If a Word Occurs As a Prefix of Any Word in a Sentence
// O(n), O(n)
func isPrefixOfWord(_ sentence: String, _ searchWord: String) -> Int {
    let arr = sentence.split(separator: " ")
    var res = -1
    let search_arr = Array(searchWord)
    for i in 0..<arr.endIndex {
        let word_arr = Array(arr[i])
        var l = 0, r = 0
        while l < word_arr.endIndex, r < search_arr.endIndex {
            if word_arr[l] != search_arr[r] {
                break
            }
            l += 1
            r += 1
        }
        if r == search_arr.endIndex {
            res = i + 1
            break
        }
    }
    return res
}