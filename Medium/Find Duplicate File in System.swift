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

//O(n), O(n)
    func findDuplicate(_ paths: [String]) -> [[String]] {
        var dict = [String: [String]]()
        var contentToFile = [String: [String]]()
        for path in paths {
            let arr = path.split(separator: " ")
            let p = String(arr[0])
            for i in 1..<arr.endIndex {
                let file = content(String(arr[i]))
                let fileName = name(String(arr[i]))
                dict[file, default:[]].append(p)
                contentToFile[file,default:[]].append(fileName)
            }
        }
        var res = [[String]]()
        for (content, paths) in dict {
            if paths.count > 1 {
                let files = contentToFile[content]!
                var curr = [String]()
                
                for (file, path) in zip(files,paths) {
                    curr.append(path+"/"+file)
                }
                res.append(curr)
            }
        }
        return res
    }
    func content(_ s: String) -> String {
        let arr = Array(s)
        let left = arr.index(of: "(")!
        let right = arr.index(of: ")")!
        return String(arr[left..<right])
    }
    func name(_ s: String) -> String {
        var arr = Array(s)
        let left = arr.index(of: "(")!
        return String(arr[..<left])
    }