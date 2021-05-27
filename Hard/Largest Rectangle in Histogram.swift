//Largest Rectangle in Histogram
//O(n), O(n)
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack = [Int]()
        var i = 0, res = 0
        func caculate() {
            let index = stack.removeLast()
            let height = heights[index]
            if !stack.isEmpty {
                let prev = stack.last!
                res = max(res, (i - prev - 1) * height)
            } else {
                res = max(res, i*height)
            }
        }   
        
        while i < heights.endIndex {
            if stack.isEmpty || heights[stack.last!] <= heights[i] {
                stack.append(i)
                i += 1
            } else {
                caculate()
            }
        }
        while !stack.isEmpty {
            caculate()
        }
        
        return res
    }