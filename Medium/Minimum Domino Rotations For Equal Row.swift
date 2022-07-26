//Minimum Domino Rotations For Equal Row
//O(n), O(1)
    func minDominoRotations(_ tops: [Int], _ bottoms: [Int]) -> Int {
        var countA = (0..<7).map {_ in 0}, countB = countA, same = countA
        for i in 0..<tops.endIndex {
            countA[tops[i]] += 1
            countB[bottoms[i]] += 1
            if tops[i] == bottoms[i] {
                same[tops[i]] += 1
            }
        }
        
        for i in 1..<7 {
            if countA[i] + countB[i] - same[i] == tops.endIndex {
                return tops.endIndex - max(countA[i], countB[i])
            }
        }
        return -1
    }