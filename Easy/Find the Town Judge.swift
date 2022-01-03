//Find the Town Judge
//O(n), O(n)
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var dict = [Int: Set<Int>](), people = Set<Int>((1...n))
        for t in trust {
            dict[t[1], default: []].insert(t[0])
            people.remove(t[0])
        }
        for i in 1...n {
            if dict[i, default:[]].count == n-1, people.contains(i) {
                return i
            }
        }
        return -1
    }