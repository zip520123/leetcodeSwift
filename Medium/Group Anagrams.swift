/*Group Anagrams*/
//time O(strs^2) space O(n)
// func groupAnagrams(_ strs: [String]) -> [[String]] {
//     var strs = strs
//     var res = [[String]]()
//     while(strs.isEmpty == false) {
//         let word = strs.first!
//         strs.removeFirst()
//         print(word,strs)
//         var dict = [Character: Int]()
//         let wcount = word.count
//         for c in word {
//             dict[c,default:0] += 1
//         }
//         var currGroup = [word]
//         var indices = [Int]()
//         matchWords: for i in 0..<strs.count {
//             let w = strs[i]
//             var dict2 = dict
//             var currCount = wcount
//             for c in w {
//                 if dict2[c,default:0] > 0 {
//                     dict2[c,default:0] -= 1
//                     currCount -= 1   
//                 } else {
//                     continue matchWords
//                 }
//             }
//             if currCount == 0 {
//                 indices.append(i)
//                 currGroup.append(w)
//             }    
//         }
//         for index in indices.reversed() {
//             strs.remove(at: index)
//         }
        
//         res.append(currGroup)
//     }
//     return res
// }

//Sorted Word as key
//time O(strs * n log n) space O(n), 164 ms, faster than 43.92%
func groupAnagrams(_ strs: [String]) -> [[String]] {
    var res = [[String]]()
    var dict = [String:[String]]()
    
    for word in strs {
        let sortedWord = word.sorted().map{String($0)}.joined()
        dict[sortedWord, default:[]].append(word)
    }
    
    for (key,value) in dict {
        res.append(value)
    }
    return res
}

//Dictionary as key
//time O(strs) space O(n) 172 ms, faster than 30.66%
func groupAnagrams(_ strs: [String]) -> [[String]] {
    var res = [[String]]()
    var dict = [Dictionary<Character,Int>:[String]]()
    for word in strs {
        var wdict = [Character:Int]()
        for c in word {
            wdict[c,default:0] += 1
        }
        dict[wdict,default:[]].append(word)
    }
    for (_, value) in dict {
        res.append(value)
    }
    return res
}

//Array as key
//time O(strs) space O(n) 132 ms, faster than 98.90%
func groupAnagrams(_ strs: [String]) -> [[String]] {
    var res = [[String]]()
    var dict = [[Int]:[String]]()
    for word in strs {
        var arr = Array(repeating:0, count:26)
        for c in word {
            arr[Int(c.asciiValue!) - 97] += 1
        }
        dict[arr,default:[]].append(word)
    }
    for (_, value) in dict {
        res.append(value)
    }
    return res
}


let input = ["eat","tea","tan","ate","nat","bat"]

print(groupAnagrams(input))