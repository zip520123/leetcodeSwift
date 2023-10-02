// Remove Colored Pieces if Both Neighbors are the Same Color
// O(n), O(1)
    func winnerOfGame(_ colors: String) -> Bool {
        var alice = 0, bob = 0
        let arr = Array(colors)
        if arr.endIndex == 1 {return false}
        for i in 1..<arr.endIndex-1 {
            if arr[i-1] == arr[i] && arr[i] == arr[i+1] {
                if arr[i] == "A" {
                    alice += 1
                } else {
                    bob += 1
                }
            } 
        }
        return alice - bob >= 1
    }