/*Backspace String Compare*/
//time O(s+t) space O(s+t)
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        let s = parse(S), t = parse(T)
        return s == t
    }
    
    func parse(_ s:String)-> String {
        var sArr = Array(s)
        var l = 0
        while l < sArr.endIndex && sArr[l] == "#" {
            sArr.remove(at:l)
        }
        
        while l < sArr.endIndex {
            if sArr[l] == "#" {
                sArr.remove(at:l)
                if l - 1 >= 0 {
                    sArr.remove(at:l-1)   
                    l -= 1
                }
            } else {
                l+=1
            }
        }
        return String(sArr)
    }
//time O(s+t) space O(1) if just use pointer
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        let sArr = Array(S), tArr = Array(T)
        var l = sArr.endIndex - 1, r = tArr.endIndex - 1, skipS = 0, skipT = 0
        
        while l >= 0 || r >= 0 {
            while l >= 0 {
                if sArr[l] == "#" {
                    skipS += 1; l -= 1
                } else if skipS > 0 {
                    skipS-=1; l -= 1
                } else {
                    break
                }    
            }
            while r >= 0 {
                if tArr[r] == "#" {
                    skipT += 1; r-=1
                } else if skipT > 0 {
                    skipT -= 1; r-=1
                } else {
                    break
                }
            }
            
            if l == -1 && r == -1 { return true }
            if l == -1 || r == -1 { return false }
            if sArr[l] != tArr[r] {return false}
            l-=1
            r-=1
        }
        
        return l == -1 && r == -1
    }