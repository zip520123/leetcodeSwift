//Minimum Rounds to Complete All Tasks
//O(n), O(n)
    func minimumRounds(_ tasks: [Int]) -> Int {
        var dict = [Int: Int]()
        for task in tasks {
            dict[task, default:0] += 1
        }
        
        var res = 0
        for count in dict.values {
            if count == 1 {
                return -1
            } else if count % 3 == 0 {
                res += count / 3
            } else {
                res += count / 3 + 1
            }
        }
        return res
    }