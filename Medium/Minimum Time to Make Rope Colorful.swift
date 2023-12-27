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

// O(n), O(n)
    func minCost(_ colors: String, _ neededTime: [Int]) -> Int {
        let arr = Array(colors)
        var stack = [(color: Character, t: Int)]()
        var res = 0
        for i in 0..<arr.endIndex {
            let currColor = arr[i], currTime = neededTime[i]
            if !stack.isEmpty {
                let lastColor = stack.last!.color, lastTime = stack.last!.t
                if lastColor == currColor {
                    stack.removeLast()
                    res += min(lastTime, currTime)
                    stack.append((currColor, max(lastTime, currTime)))
                } else {
                    stack.append((currColor, currTime))    
                }
            } else {
                stack.append((currColor, currTime))
            }
        }
        return res
    }

// O(n), O(1)
func minCost(_ colors: String, _ neededTime: [Int]) -> Int {
    let arr = Array(colors)
    var currColorIndex = 0
    var res = 0
    for i in 1..<arr.endIndex {
        if arr[i] == arr[currColorIndex] {
            if neededTime[currColorIndex] < neededTime[i] {
                res += neededTime[currColorIndex]
                currColorIndex = i
            } else {
                res += neededTime[i]
            }
        } else {
            currColorIndex = i
        }
    }
    return res
}