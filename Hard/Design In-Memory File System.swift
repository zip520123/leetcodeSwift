// Design In-Memory File System
class Trie {
    var memo = [String: Trie]()
    var content: String?
}
class FileSystem {
    let root = Trie()
    
    func ls(_ path: String) -> [String] {
        let arr = pathList(path)
        var curr = root
        for p in arr {
            curr = curr.memo[p]!
        }
        if curr.content != nil {
            return [arr.last!]
        }
        return curr.memo.keys.sorted()
    }

    func pathList(_ path: String) -> [String] {
        var res = [String]()
        var l = 0, r = 1
        let arr = Array(path)
        while r<arr.endIndex {
            while r<arr.endIndex, arr[r] != "/" {
                r += 1
            }
            if l+1 < r {
                res.append(String(arr[(l+1)..<r]))
            }
            l = r
            r += 1
        }
        return res
    }
    
    func mkdir(_ path: String) {
        let arr = pathList(path)
        var curr = root
        for p in arr {
            if curr.memo[p] == nil {
                curr.memo[p] = Trie()
            }
            curr = curr.memo[p]!
        }
    }
    
    func addContentToFile(_ filePath: String, _ content: String) {
        var arr = pathList(filePath)
        let fileName = arr.removeLast()
        var curr = root
        for p in arr {
            if curr.memo[p] == nil {
                curr.memo[p] = Trie()
            }
            curr = curr.memo[p]!
        }
        if curr.memo[fileName] == nil {
            curr.memo[fileName] = Trie()
            curr.memo[fileName]!.content = content
        } else {
            curr.memo[fileName]!.content! += content
        }
    }
    
    func readContentFromFile(_ filePath: String) -> String {
        var arr = pathList(filePath)
        let fileName = arr.removeLast()
        var curr = root
        for p in arr {
            if curr.memo[p] == nil {
                curr.memo[p] = Trie()
            }
            curr = curr.memo[p]!
        }
        if curr.memo[fileName] == nil {
            return ""
        } else {
            return curr.memo[fileName]!.content!
        }
    }
}