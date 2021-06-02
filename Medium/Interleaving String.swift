//Interleaving String
//O(2^s1+s2), O(s1+s2), brute force TLE 
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let sArr1 = Array(s1), sArr2 = Array(s2), sArr3 = Array(s3)
        func dfs(_ index1: Int, _ index2: Int, _ index3: Int) -> Bool {
            if index1 == sArr1.endIndex && index2 == sArr2.endIndex && index3 == sArr3.endIndex {return true}
            if index3 == sArr3.endIndex {return false}
            var res = false
            if index1 < sArr1.endIndex && sArr1[index1] == sArr3[index3] {
                res = res || dfs(index1+1, index2, index3+1)
            } 
            if index2 < sArr2.endIndex && sArr2[index2] == sArr3[index3] {
                res = res || dfs(index1,index2+1, index3+1)
            }
            return res
        }
        return dfs(0,0,0)
    }

//O(s1.len*s2.len), O(s1.len*s2.len), dp
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let sArr1 = Array(s1), sArr2 = Array(s2), sArr3 = Array(s3)
        var dict = [[Int]: Bool]()
        func dfs(_ index1: Int, _ index2: Int, _ index3: Int) -> Bool {
            if dict[[index1,index2,index3]] != nil {
                return dict[[index1,index2,index3]]!
            }
            if index1 == sArr1.endIndex && index2 == sArr2.endIndex && index3 == sArr3.endIndex {return true}
            if index3 == sArr3.endIndex {return false}
            var res = false
            if index1 < sArr1.endIndex && sArr1[index1] == sArr3[index3] {
                res = res || dfs(index1+1, index2, index3+1)
            } 
            if index2 < sArr2.endIndex && sArr2[index2] == sArr3[index3] {
                res = res || dfs(index1, index2+1, index3+1)
            }
            dict[[index1,index2,index3]] = res
            return res
        }
        return dfs(0,0,0)
    }