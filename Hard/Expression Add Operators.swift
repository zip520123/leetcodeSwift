//Expression Add Operators
//O(4^n) O(n)
    func addOperators(_ num: String, _ target: Int) -> [String] {
        var res = [String]()
        let sArr = Array(num)
        func dfs(_ i: Int, _ path: String, _ value: Int, _ prevOperand: Int, _ currOperand: Int) {
            if i == sArr.endIndex {
                if value == target && currOperand == 0 {
                    res.append(String(path.dropFirst()))
                }
                return 
            }
            var currOperand = currOperand
            
            let n = Int(String(sArr[i]))!
            currOperand = currOperand*10 + n
            if currOperand > 0 {
                dfs(i+1, path, value, prevOperand, currOperand)    
            }
            dfs(i+1, path+"+\(currOperand)", value+currOperand, currOperand, 0)

            if path.count > 0 {
                dfs(i+1, path+"-\(currOperand)", value - currOperand, -currOperand, 0)

                dfs(i+1, path+"*\(currOperand)", value - prevOperand + currOperand * prevOperand, currOperand * prevOperand, 0)    
            }
        }
        dfs(0, "", 0, 0, 0)
        return res
    }

class Solution {
    func addOperators(_ num: String, _ target: Int) -> [String] {
        var res = [String]()
        let sArr = Array(num)
        func dfs(_ path: String, _ index: Int, _ value: Int, _ multed: Int) {
            if index == sArr.endIndex {
                if value == target {
                    res.append(path)    
                }
                return
            }
            var curr = 0
            for i in index..<sArr.endIndex {
                if i != index && sArr[index] == "0" {break}
                curr = curr*10 + Int(String(sArr[i]))!
                if index == 0 {
                    dfs(path+"\(curr)",i+1, curr, curr)
                } else {
                    dfs(path+"+\(curr)", i+1, value + curr, curr)
                    dfs(path+"-\(curr)", i+1, value - curr, -curr)
                    dfs(path+"*\(curr)", i+1, value - multed + multed * curr, multed * curr)
                }
            }
        }
        dfs("",0,0,0)
        return res
    }
}

    func addOperators(_ num: String, _ target: Int) -> [String] {
        var res = [String]()
        let arr = Array(num)
        func dfs(_ index: Int, _ path: String, _ prev: Int, _ curr: Int) {
            if index == arr.endIndex {
                if curr == target {
                    res.append(path)
                }
                return
            }
            
            for i in index..<arr.endIndex {
                if i != index && arr[index] == "0" {continue}
                let n = Int(String(arr[index...i]))!
                
                if index == 0 {
                    dfs(i+1, "\(n)", n, n)    
                } else {
                    dfs(i+1,path+"+\(n)", n, curr+n)
                    dfs(i+1,path+"-\(n)", -n, curr-n)
                    dfs(i+1,path+"*\(n)", prev*n , (curr-prev) + (prev*n))
                }
            }
        }
        dfs(0,"",0,0)
        return res
    }

    func addOperators(_ num: String, _ target: Int) -> [String] {
        var res = [String]()
        let sArr = Array(num)
        func dfs( _ p: Int, _ curr: Int, _ index: Int, _ path: String) {
            if index == sArr.endIndex {
                if curr == target {
                    res.append(path)
                }
            }
            var n = 0
            for i in index..<sArr.endIndex {
                if i != index && sArr[index] == "0" {break}
                n = n*10 + Int(String(sArr[i]))!
                
                if index == 0 {
                    dfs(n, n, i+1, path + "\(n)" )    
                } else {
                    dfs(n, curr+n, i+1, path + "+\(n)" )
                    dfs(-n, curr-n, i+1, path + "-\(n)")
                    dfs(p*n, curr-p+p*n , i+1, path + "*\(n)" ) 
                }
            }
        }
        
        dfs(0,0,0,"")
        return res
    }