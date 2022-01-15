//Jump Game IV
//O(n), O(n)
    func minJumps(_ arr: [Int]) -> Int {
        var dict = [Int: [Int]]()
        for (i,n) in arr.enumerated() {
            dict[n, default:[]].append(i)
        }
        var steps = [Int: Int]()
        var queue = [0]
        steps[0] = 0
        var step = 0
        while !queue.isEmpty {
            let temp = queue
            queue.removeAll()
            step += 1
            for i in temp {
                let n = arr[i]
                if i == arr.endIndex-1 {
                    return steps[arr.endIndex-1]!
                }
                
                for next in dict[n, default:[]] {
                    if steps[next] == nil {
                        steps[next] = step 
                        queue.append(next)
                    }
                }
                dict[n] = []
                
                if i+1 < arr.endIndex {
                    if steps[i+1] == nil {
                        steps[i+1] = step 
                        queue.append(i+1)
                    }
                }
                if i-1 >= 0 {
                    if steps[i-1] == nil {
                        steps[i-1] = step
                        queue.append(i-1)
                    }
                }   
            }
        }
        return steps[arr.endIndex-1]!
    }