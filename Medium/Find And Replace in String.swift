/*Find And Replace in String*/
//time O(indexes + S + targets) space O(S+targets)
func findReplaceString(_ S: String, _ indexes: [Int], _ sources: [String], _ targets: [String]) -> String { 
    let sArr = Array(S)
    var arr = [Int](repeating: -1, count: sArr.endIndex)
    for (i,(index,source)) in zip(indexes, sources).enumerated() {
        var l = index
        var r = 0
        let soArr = Array(source)
        while l < sArr.endIndex && r < soArr.endIndex && sArr[l] == soArr[r] {
            l += 1
            r += 1
        }
        if r == soArr.endIndex {
            arr[index] = i
        }
    }
    var i = 0
    var res = [Character]()
    while i < sArr.endIndex {
        if arr[i] != -1 {
            let target = targets[arr[i]]
            for char in target {
                res.append(char) 
            }
            i += Array(sources[arr[i]]).endIndex
        } else {
            res.append(sArr[i])
            i+=1
        }
    }
    return String(res)
}

func findReplaceString(_ S: String, _ indexes: [Int], _ sources: [String], _ targets: [String]) -> String {
    var dict = [Int:(source:String,target:String)]()
    for (i,index) in indexes.enumerated() {
        dict[index] = (sources[i],targets[i])
    }
    var i = 0
    var res = [Character]()
    let sArr = Array(S)
    while i < sArr.endIndex {
        if let some = dict[i], i + some.source.count <= sArr.endIndex && String(sArr[i..<i + some.source.count]) == some.source {
            for char in some.target {
                res.append(char)
            }
            i += some.source.count
        } else {
            res.append(sArr[i])
            i+=1
        }
    }
    return String(res)
}

func findReplaceString(_ S: String, _ indexes: [Int], _ sources: [String], _ targets: [String]) -> String {
    var dict = [Int:(source:String,target:String)]()
    for (i,index) in indexes.enumerated() {
        dict[index] = (sources[i],targets[i])
    }
    var i = 0
    var res = [Character]()
    let sArr = Array(S)
    while i < sArr.endIndex {
        if let (source, target) = dict[i], i + source.count <= sArr.endIndex && String(sArr[i..<i + source.count]) == source {
            for char in target {
                res.append(char)
            }
            i += source.count
        } else {
            res.append(sArr[i])
            i+=1
        }
    }
    return String(res)
}