//Restore IP Addresses
//O(M^N*N), O(M*N)
    func restoreIpAddresses(_ s: String) -> [String] {
        var res = [String]()
        let arr = Array(s)
        func dfs(_ index: Int, _ path: [String]) {
            if index == s.count {
                if path.endIndex == 4 {
                    res.append(path.joined(separator: "."))
                }
                return
            }
            for i in 0...2 where index+i<arr.endIndex {
                let curr = String(arr[index...index+i])
                if curr.count > 1 && Array(curr)[0] == "0" {continue}
                if let n = Int(curr), n <= 255 {
                    dfs(index+i+1, path+[curr])
                }
            }
        }
        dfs(0,[])
        return res
    }