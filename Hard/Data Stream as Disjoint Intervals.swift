//Data Stream as Disjoint Intervals
class SummaryRanges {
    var set = Set<Int>()
    
    func addNum(_ value: Int) { //O(1)
        set.insert(value)
    }
    
    func getIntervals() -> [[Int]] { //O(n log n)
        if set.isEmpty {return [[]]}
        var res = [[Int]]()
        var l = -1, r = -1
        for n in Array(set).sorted() {
            if l == -1 {
                l = n
                r = n
            } else if n == r+1 {
                r = n
            } else {
                res.append([l,r])
                l = n
                r = n
            }
        }
        res.append([l,r])
        return res
    }
}