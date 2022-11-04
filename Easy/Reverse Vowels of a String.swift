//Reverse Vowels of a String
    func reverseVowels(_ s: String) -> String {
        let set = Set<Character>("aeiouAEIOU")
        var sArr = Array(s)
        var l = 0, r = sArr.endIndex - 1
        while l < r {
            while set.contains(sArr[l]) == false && l < r {
                l += 1
            }
            while set.contains(sArr[r]) == false && l < r {
                r -= 1
            }
            if set.contains(sArr[l]) && set.contains(sArr[r]) {
                (sArr[l],sArr[r]) = (sArr[r],sArr[l])
                l += 1
                r -= 1
            }
        }
        return String(sArr)
    }

//O(n), O(n)
    func reverseVowels(_ s: String) -> String {
        var temp = [Character]()
        for char in s {
            switch char {
                case "a","e","i","o","u","A","E","I","O","U":
                    temp.append(char)
                default:
                break
            }

        }
        temp = temp.reversed()
        var index = 0, arr = Array(s)
        
        for i in 0..<arr.endIndex {
            switch arr[i] {
                case "a","e","i","o","u","A","E","I","O","U":
                    arr[i] = temp[index]
                    index += 1
                default:
                break
            }
        }
        return String(arr)
    }