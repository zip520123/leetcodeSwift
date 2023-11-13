// Sort Vowels in a String
// O(n log n), O(n)
    func sortVowels(_ s: String) -> String {
        var res = Array(s)
        var vowels = [Character]()
        for char in res {
            switch char {
                case "a", "e","i","o","u","A","E","I","O","U":
                    vowels.append(char)
                default:
                    break
            }
        }
        vowels.sort()
        var j = 0
        for i in 0..<res.endIndex {
            let char = res[i]
            switch char {
                case "a", "e","i","o","u","A","E","I","O","U":
                    res[i] = vowels[j]
                    j += 1
                default:
                    break
            }
        }
        return String(res)
    }