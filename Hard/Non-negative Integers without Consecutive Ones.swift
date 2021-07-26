//Non-negative Integers without Consecutive Ones
//TLE
class Solution {
    func findIntegers(_ n: Int) -> Int {
        if n == 1 {return 2}
        if n == 2 {return 3}
        
        var res = 3
        var queue = [2]
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            let add0 = curr << 1 
            if add0 > n {
                return res
            }
            res += 1
            queue.append(add0)
            
            let add1 = add0 + 1
            if add1 > n {
                return res
            }
            if add1 & 2 == 0 {
                res += 1
                queue.append(add1)
            }
        }
        
        return res
    }
}
/*
res 2
1111 -> 0 + (1010) = 8
1010 -> 1 + (1001) = 8
1001 -> 1 + (1000) = 7
1000 -> 1 + (101) = 6
101 -> 1 + (100) = 5
100 -> 1 + (10) = 4
10 -> 1 + (0) + (1) = 3
0 = 1
1 = 1

    
*/