//Check if the Sentence Is Pangram
//O(n), O(n)
    func checkIfPangram(_ sentence: String) -> Bool {
        let set = Set(Array(sentence))
        for char in "abcdefghijklmnopqrstuvwxyz" {
            if set.contains(char) == false {
                return false
            }
        }
        return true
    }

//O(n), O(1)
    func checkIfPangram(_ sentence: String) -> Bool {
        for char in "abcdefghijklmnopqrstuvwxyz" {
            if sentence.contains(char) == false {
                return false
            }
        }
        return true
    }