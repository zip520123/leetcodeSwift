//Design Hit Counter

class HitCounter {

    private var hits = [Int]()
    
    func hit(_ timestamp: Int) { //O(1)
        hits.append(timestamp)
    }

    func getHits(_ timestamp: Int) -> Int { //O(n)
        while !hits.isEmpty {
            let diff = timestamp - hits.first!
            if diff >= 300 {
                hits.removeFirst()
            } else {
                break
            }
        }
        return hits.endIndex
    }
}

//follow up
class HitCounter {

    private var hits = [(Int, Int)]()
    private var total = 0
    
    func hit(_ timestamp: Int) { //O(1)
        if let (lastTimestamp, count) = hits.last {
            if lastTimestamp == timestamp {
                hits.removeLast()
                hits.append((timestamp,count+1))
            } else {
                hits.append((timestamp, 1))
            }
        } else {
            hits.append((timestamp, 1))
        }
        total += 1
    }

    func getHits(_ timestamp: Int) -> Int { //O(n)
        while !hits.isEmpty {
            let (firstTimestamp, count) = hits.first!
            let diff = timestamp - firstTimestamp
            if diff >= 300 {
                total -= count
                hits.removeFirst()
            } else {
                break
            }
        }
        return total
    }
}