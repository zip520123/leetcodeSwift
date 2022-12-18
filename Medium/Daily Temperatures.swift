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
//O(n), O(n)
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var res = [Int](), stack = [Int]()
        
        for i in (0..<temperatures.endIndex).reversed() {
            while stack.count > 0 && temperatures[stack.first!] <= temperatures[i] {
                stack.removeFirst()
            }
            if stack.count == 0 {
                res.insert(0, at: 0)
            } else {
                res.insert(stack.first!-i, at: 0)
            }
            stack.insert(i, at: 0)
        }
        
        return res
    }

//O(n), O(n)
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var res = (0..<temperatures.endIndex).map {_ in 0}
        var stack = [Int]()
        
        for i in (0..<temperatures.endIndex).reversed() {
            while stack.count > 0 && temperatures[stack.first!] <= temperatures[i] {
                stack.removeFirst()
            }
            if stack.count != 0 {
                res[i] = stack.first!-i
            }
            stack.insert(i, at: 0)
        }
        
        return res
    }

//O(n), O(n)
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var res = [Int]()
        var stack = [Int]()
        for i in (0..<temperatures.endIndex).reversed() {
            let curr = temperatures[i]
            while !stack.isEmpty && temperatures[stack.last!] <= curr {
                stack.removeLast()
            }
            if stack.isEmpty {
                res.append(0)
            } else {
                res.append(stack.last!-i)
            }
            stack.append(i)
        }
        return res.reversed()
    }