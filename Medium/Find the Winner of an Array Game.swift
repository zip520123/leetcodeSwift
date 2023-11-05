// Find the Winner of an Array Game
// O(n^2), O(n)
func getWinner(_ arr: [Int], _ k: Int) -> Int {
    var arr = arr
    var curr = arr[0], count = 0
    while true {
        
        if arr[0] < arr[1] {
            if curr == arr[1] {
                count += 1
                if count == k {
                    return curr
                }
            } else {
                curr = arr[1]
                count = 1
            }
            let n = arr.removeFirst()
            arr.append(n)
        } else {
            let n = arr.remove(at: 1)
            arr.append(n)
            if curr == arr[0] {
                count += 1
                if count == k {
                    return curr
                }
            } else {
                curr = arr[0]
                count = 1
            }
        }
    }
    return 0
}