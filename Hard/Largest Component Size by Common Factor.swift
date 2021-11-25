//Largest Component Size by Common Factor
class Solution {
    func factors(_ num: Int) -> [Int] {
        var result = [Int]() 
        var factor = 2 
        var num = num
        
        var prev = 1
        while num >= factor * factor {
            if num % factor == 0 {
                if factor != prev {
                    result.append(factor)
                }
                prev = factor
                num = num / factor
            } else {
                factor += 1
            }
        }
        
        result.append(num) 
        return result
    }
    
    func largestComponentSize(_ nums: [Int]) -> Int {
        var dict = [Int: [Int]]()
        for (i,n) in nums.enumerated() {
            for factor in factors(n) {
                dict[factor, default:[]].append(i)
            }
        }

        var uf = [Int: Int]()
        for i in 0..<nums.endIndex {
            uf[i] = i
        }
        
        func find(_ x: Int) -> Int {
            if uf[x]! == x {return x}
            uf[x] = find(uf[x]!)
            return uf[x]!
        }
        
        func union(_ x: Int, _ y: Int) {
            let root1 = find(x), root2 = find(y)
            uf[root2] = root1
        }
        
        for (_, list) in dict {
            for i in 0..<list.endIndex-1 {
                union(list[i], list[i+1])
            }
        }
        
        var keyToCount = [Int: Int]()
        for i in 0..<nums.endIndex {
            let root = find(i)
            keyToCount[root, default:0] += 1
        }
        
        return keyToCount.values.max() ?? 0
    }
}