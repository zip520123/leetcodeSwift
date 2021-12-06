//Minimum Cost to Move Chips to The Same Position
//O(n),O(1)
    func minCostToMoveChips(_ position: [Int]) -> Int {
        var odd = 0, even = 0
        for n in position {
            if n % 2 == 0 {
                even += 1
            } else {
                odd += 1
            }
        }   
        return min(odd, even)
    }