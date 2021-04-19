//Buildings With an Ocean View
//O(n) O(n)
    func findBuildings(_ heights: [Int]) -> [Int] {
        var stack = [Int]()
        for i in 0..<heights.endIndex {
            
            while !stack.isEmpty && heights[stack.last!] <= heights[i] {
                stack.removeLast()    
            }
            
            stack.append(i)
        }
        return stack
    }