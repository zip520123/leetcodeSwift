//Reduce Array Size to The Half
//O(n log n), O(n)
    func minSetSize(_ arr: [Int]) -> Int {
        var dict = [Int:Int]()
        for n in arr {
            dict[n, default: 0] += 1
        }
        let sortedKey = dict.sorted {a, b in a.value < b.value}.map {$0.value}
        var res = 0, count = 0
        
        for i in (0..<sortedKey.endIndex).reversed() {
            count += sortedKey[i]
            res += 1
            if count >= arr.endIndex / 2 {
                return res
            }
        } 
        return res
    }
    
//O(n), O(n)
    func minSetSize(_ arr: [Int]) -> Int {
        var list = (0...arr.endIndex).map{_ in [Int]()}
        var dict = [Int:Int]()
        for n in arr {
            dict[n,default:0] += 1
        }
        
        for count in dict.values {
            list[count].append(count)
        }
        var res = 0, count = 0
        for i in (0..<list.endIndex).reversed() {
            let counts = list[i]
            for value in counts {
                count += value
                res += 1
                if count >= arr.endIndex/2 {
                    return res
                }
            }
        }
        return res
    }