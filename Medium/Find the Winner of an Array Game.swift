// Find the Winner of an Array Game
// O(n), O(n), queue
func getWinner(_ arr: [Int], _ k: Int) -> Int {
    var queue = arr
    var curr = queue.removeFirst()
    var wins = 0
    var maxE = arr.max()!
    while true {
        var num = queue.removeFirst()
        if curr > num {
            wins += 1
            queue.append(num)

        } else {
            wins = 1
            queue.append(curr)
            curr = num
        }
        if wins == k || curr == maxE {
            return curr
        }
    }
    return 0
}

// O(n), O(1)
func getWinner(_ arr: [Int], _ k: Int) -> Int {
    var maxE = arr.max()!
    var curr = arr[0]
    var wins = 0
    
    for i in 1..<arr.endIndex {
        let num = arr[i]
        if curr > num {
            wins += 1
        } else {
            wins = 1
            curr = num
        }
        if wins == k || curr == maxE {
            return curr
        }
    }
    return maxE
}