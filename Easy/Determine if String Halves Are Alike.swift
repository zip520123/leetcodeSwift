//Determine if String Halves Are Alike
//O(n),O(n)
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

//O(n), O(n)
    func halvesAreAlike(_ s: String) -> Bool {
        let arr = Array(s)
        let a = arr[0..<arr.endIndex/2], b = arr[(arr.endIndex/2)...]
        var count = 0
        for char in a {
            switch char {
                case "a","e", "i","o","u","A","E","I","O","U":
                    count += 1
                default:
                    break
            }
        }
        for char in b {
            switch char {
                case "a","e", "i","o","u","A","E","I","O","U":
                    count -= 1
                default:
                    break
            }
        }
        return count == 0
    }