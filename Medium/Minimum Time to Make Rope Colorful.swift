//Minimum Time to Make Rope Colorful
//O(n), O(n)
    func minCost(_ colors: String, _ neededTime: [Int]) -> Int {
        let arr = Array(colors)
        var stack = [Int](), res = 0
        for (i, char) in arr.enumerated() {
            
            if let lastIndex = stack.last {
                let last = arr[lastIndex]
                if last == char {
                    if neededTime[lastIndex] <= neededTime[i] {
                        stack.removeLast()
                        res += neededTime[lastIndex]
                        stack.append(i)
                    } else {
                        res += neededTime[i]
                    }
                } else {
                    stack.append(i)        
                }
            } else {
                stack.append(i)
            }
            
        }
        return res
    }