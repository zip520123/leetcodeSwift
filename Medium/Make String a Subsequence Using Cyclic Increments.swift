// Make String a Subsequence Using Cyclic Increments
// O(n), O(1)
func canMakeSubsequence(_ str1: String, _ str2: String) -> Bool {
    var cyclically_next = [Character: Character]()
    for asciiNum in Character("a").asciiValue!...Character("z").asciiValue! {
        let char = Character(UnicodeScalar(asciiNum))
        let nextAsciiNum = UInt8((Int(asciiNum) - Int(Character("a").asciiValue!) + 1) % 26) + Character("a").asciiValue!
        cyclically_next[char] = Character(UnicodeScalar(nextAsciiNum))
    }

    var l = 0, r = 0
    let arr1 = Array(str1), arr2 = Array(str2)
    while l < arr1.endIndex, r < arr2.endIndex {
        if arr1[l] == arr2[r] || cyclically_next[arr1[l]] == arr2[r] {
            r += 1
        }
        l += 1
    }
    if r == arr2.endIndex {
        return true
    }
    return false

}