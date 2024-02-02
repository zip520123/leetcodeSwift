// Flip Game
// O(n), O(n)
func generatePossibleNextMoves(_ currentState: String) -> [String] {
    var res = [String]()
    let arr = Array(currentState)
    if arr.endIndex == 1 {return []}
    for i in 1..<arr.endIndex {
        if arr[i] == "+", arr[i-1] == "+" {
            let curr = String(arr[0..<i-1]) + "--" + String(arr[(i+1)...])
            res.append(curr)
        } 
    }
    return res
}