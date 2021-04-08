//Determine if String Halves Are Alike
func halvesAreAlike(_ s: String) -> Bool {
        let set = Set("aeiouAEIOU")
        var count = 0
        let sArr = Array(s)
        for (i,char) in sArr.enumerated() {
            if set.contains(char) {
                if i < sArr.endIndex>>1 {
                    count += 1
                } else {
                    count -= 1
                }
            } 
        }
        return count == 0
    }