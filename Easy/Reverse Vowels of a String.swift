//Reverse Vowels of a String
//O(n), O(1)
    func reverseVowels(_ s: String) -> String {
        let set = Set<Character>("aeiouAEIOU")
        var arr = Array(s), l = 0, r = arr.endIndex-1
        while l<r {
            while l<r && set.contains(arr[l]) == false {
                l += 1
            }
            while l<r && set.contains(arr[r]) == false {
                r -= 1
            }

            if set.contains(arr[l]) && set.contains(arr[r]) {
                (arr[l], arr[r]) = (arr[r], arr[l])
                l += 1
                r -= 1
            }
            
        }
        return String(arr)
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