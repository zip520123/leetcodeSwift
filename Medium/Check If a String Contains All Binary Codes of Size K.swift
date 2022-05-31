//Check If a String Contains All Binary Codes of Size K
//O(s*k), O(s*k)
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        var need = 1 << k
        var got = Set<String>()
        let arr = Array(s)
        var i = k 
        while i <= arr.endIndex {
            let temp = String(arr[i-k..<i])
            if got.contains(temp) == false {
                got.insert(temp)
                need -= 1
                if need == 0 {
                    return true
                }
            }
            i += 1
        }
        return false
    }

//prefer i start from 0
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        var need = 1 << k
        let arr = Array(s)
        var set = Set<String>()
        var i = 0
        while i <= arr.endIndex-k {
            let temp = String(arr[i..<i+k])
            if set.contains(temp) == false {
                set.insert(temp)
                need -= 1
                if need == 0 {
                    return true
                }
            }
            i += 1
        }
        return false
    }