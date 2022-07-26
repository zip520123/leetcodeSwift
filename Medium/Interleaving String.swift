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

//O(s1.len*s2.len), O(s1,len*s2.len)
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let s1 = Array(s1), s2 = Array(s2), s3 = Array(s3)
        var dict = [[Int]: Bool]()
        func dfs(_ l: Int, _ r: Int, _ i: Int) -> Bool {
            if dict[[l,r,i]] != nil {return dict[[l,r,i]]!}
            var res = false
            if l==s1.endIndex && r==s2.endIndex && i==s3.endIndex {
                res = true
            }
            
            if l<s1.endIndex && i<s3.endIndex && s1[l] == s3[i] {
                if dfs(l+1,r,i+1) {
                    res = true
                }
            }
            if r<s2.endIndex && i<s3.endIndex && s2[r] == s3[i] {
                if dfs(l,r+1,i+1) {
                    res = true    
                }
            }
            dict[[l,r,i]] = res
            return res
        }
        
        return dfs(0,0,0)
    }