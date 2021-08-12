/*Group Anagrams*/
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