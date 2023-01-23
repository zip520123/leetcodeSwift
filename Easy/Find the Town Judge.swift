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

//O(n), O(n)
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var people = Set<Int>((1...n)), dict = [Int: Int]()
        
        for t in trust {
            people.remove(t[0])
            dict[t[1], default:0]+=1
        }
        
        for person in people {
            if dict[person, default:0] == n-1 {
                return person
            }
        }
        
        return -1
    }

//O(n), O(n)
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var dict = [Int: Int]()
        var dict2 = [Int: Int]()
        for t in trust {
            dict[t[0], default:0] += 1
            dict2[t[1], default:0] += 1
        }
        for p in 1...n {
            if dict[p, default:0] == 0 && dict2[p, default:0] == n-1 {
                return p
            }
        }
        return -1
    }