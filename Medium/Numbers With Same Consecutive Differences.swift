//Numbers With Same Consecutive Differences
//O(n), O(n)
    func numsSameConsecDiff(_ n: Int, _ k: Int) -> [Int] {
        var queue = [[Int]]()
        for i in 1...9 {
            queue.append([i])
        }
        for _ in 1..<n {
            let temp = queue
            queue.removeAll()
            for item in temp {
                let last = item.last!
                if last+k >= 0 && last+k <= 9 {
                    queue.append(item+[last+k])
                }
                if k == 0 {continue}
                if last-k >= 0 && last-k <= 9 {
                    queue.append(item+[last-k])
                }
            }
        }
        return queue.map { item in
                         var str = ""
                          for n in item {
                              str += String(n)
                          }
                          return Int(str)!
                         }
    }