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

//O(n log n), O(n)
    func minSetSize(_ arr: [Int]) -> Int {
        var dict = [Int: Int]()
        for n in arr {
            dict[n, default: 0] += 1
        }
        let sortedCount = dict.values.sorted(by: >)
        var curr = 0
        for (i, count) in sortedCount.enumerated() {
            curr += count
            if curr >= arr.endIndex/2 {
                return i+1
            }
        }
        return 0
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

//O(n), O(n)
    func minSetSize(_ arr: [Int]) -> Int {
        var list = [[Int]](repeating: [Int](), count: arr.endIndex+1)
        var dict = [Int: Int]()
        for n in arr {
            dict[n, default: 0] += 1
        }
        for (_, value) in dict {
            list[value].append(value)
        }
        var curr = 0, res = 0
        for item in list.reversed() {
            for value in item {
                curr += value
                res += 1
                if curr >= arr.endIndex/2 {
                    return res
                }
            }
        }
        return 0
    }