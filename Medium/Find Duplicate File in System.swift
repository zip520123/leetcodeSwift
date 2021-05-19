//Find Duplicate File in System
//O(n), O(n), n = paths.len
    func findDuplicate(_ paths: [String]) -> [[String]] {
        var contentToStrings = [String:[String]]()
        for curr in paths {
            let data = curr.split(separator: " ")
            let path = data[0]
            for i in 1..<data.endIndex {
                let file = data[i].split(separator: "(")
                let name = file[0], content = String(file[1])
                let fileAndPath = String(path + "/" + name)
                contentToStrings[content, default:[]].append(fileAndPath)
            }
        }
        return Array(contentToStrings.values.filter{$0.endIndex > 1})
    }