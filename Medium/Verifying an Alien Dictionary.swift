//Verifying an Alien Dictionary
//O(n log n) O(n)
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var dict = [Character:Int]()
        dict[" "] = -1
        
        for (i,char) in order.enumerated() {
            dict[char] = i
        }
        
        let compare : (String,String) -> Bool = { a,b in
            let arr1 = Array(a + " "), arr2 = Array(b + " ")
            var i = 0
           while i < arr1.endIndex && i < arr2.endIndex {
               if dict[arr1[i]]! < dict[arr2[i]]! {
                   return true
               } else if dict[arr1[i]]! > dict[arr2[i]]! {
                   return false
               } else if dict[arr1[i]]! == dict[arr2[i]]! {
                   i+=1
               }
           }
           return true
         } 
        
        let sortedWords = words.sorted(by: compare)
        
        for (word,sortedWord) in zip(words, sortedWords) {
            if word != sortedWord {
                return false
            }
        }
        return true
    }

    //O(n) 
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var dict = [Character:Int]()
        dict[" "] = -1
        for (i,char) in order.enumerated() {
            dict[char] = i
        }
        
        let compare : (String, String) -> Bool = { a,b in
            var i = 0
            let arr1 = Array(a+" "), arr2 = Array(b+" ")
             while i < arr1.endIndex && i < arr2.endIndex {
                 if dict[arr1[i]]! != dict[arr2[i]]! {
                     return dict[arr1[i]]! < dict[arr2[i]]!
                 } else {
                     i += 1
                 }
             }
           return true 
        }
        
        for i in 0..<words.endIndex-1 {
            let word1 = words[i], word2 = words[i+1]
            if compare(word1,word2) == false {
                return false
            }
        }
        return true
    }

    //O(n)
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var dict = [Character: Int]()
        for (i,char) in order.enumerated() {
            dict[char] = i
        }
        for i in 0..<words.endIndex-1 {
            let w1 = Array(words[i]), w2 = Array(words[i+1])
            var j = 0
            while j < w1.endIndex && j < w2.endIndex {
                if w1[j] != w2[j] {
                    if dict[w1[j]]! > dict[w2[j]]! {
                        return false
                    } else {
                        break
                    }   
                }
                j += 1
            }
            if j == w2.endIndex && w1.endIndex > w2.endIndex {
                return false
            }
        }
        return true
    }