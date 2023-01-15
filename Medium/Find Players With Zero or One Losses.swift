//Find Players With Zero or One Losses
//O(n log n), O(n)
    func findWinners(_ matches: [[Int]]) -> [[Int]] {
        var set = Set<Int>()
        var lost = [Int: Int]()
        for match in matches {
            let l = match[1]
            let w = match[0]
            set.insert(l)
            set.insert(w)
            lost[l, default:0] += 1
        }
        var arr1 = [Int](), arr2 = [Int]()
        for player in set.sorted() {
            let n = lost[player, default:0] 
            if n == 0 {
                arr1.append(player)
            } else if n == 1 {
                arr2.append(player)
            }
        }
        
        return [arr1, arr2]
    }