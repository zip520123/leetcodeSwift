//Daily Temperatures
//O(n), O(n)
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var res = [Int](), stack = [Int]()
        for i in (0..<temperatures.endIndex).reversed() {
            while stack.endIndex>0 && temperatures[stack.last!] <= temperatures[i] {
                stack.removeLast()
            }
            if stack.count == 0 {
                res.insert(0, at: 0)    
            } else {
                res.insert(stack.last! - i, at: 0)
            }
            stack.append(i)
        }
        return res
    }

// O(n), O(n)
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var stack = [Int]()
        var res = temperatures.map { _ in 0 }
        for i in 0..<temperatures.endIndex {
            let curr = temperatures[i]
            while !stack.isEmpty && curr > temperatures[stack.last!] {
                res[stack.last!] = i - stack.last!
                stack.removeLast()
            }
            stack.append(i)
        }
        return res
    }