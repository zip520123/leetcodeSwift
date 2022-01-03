//Find the Town Judge
//O(n), O(n^2)
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var dict = [Int: Set<Int>](), peopleDontTrust = Set<Int>((1...n))
        for t in trust {
            dict[t[1], default: []].insert(t[0])
            peopleDontTrust.remove(t[0])
        }
        for person in 1...n {
            if dict[person, default:[]].count == n-1, peopleDontTrust.contains(person) {
                return person
            }
        }
        return -1
    }