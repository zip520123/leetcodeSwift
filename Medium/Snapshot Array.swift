// Snapshot Array
//O(len * snap), O(len * snap), MLE
class SnapshotArray {
    var dict = [Int: Int]()
    var snapDict = [Int: [Int: Int]]()
    var id = 0

    func set(_ index: Int, _ val: Int) {
        dict[index] = val
    }
    
    func snap() -> Int {
        snapDict[id] = dict
        id += 1
        return id-1
    }
    
    func get(_ index: Int, _ snap_id: Int) -> Int {
        snapDict[snap_id]![index] ?? 0
    }
}

//O(len*snap), O(len*snap), MLE
class SnapshotArray {

    var dict = [Int: [Int]]()
    var arr: [Int]
    var id = 0
    init(_ length: Int) {
        arr = [Int](repeating: 0, count: length)
    }
    
    func set(_ index: Int, _ val: Int) {
        arr[index] = val
    }
    
    func snap() -> Int {
        dict[id] = arr
        id += 1
        return id-1
    }
    
    func get(_ index: Int, _ snap_id: Int) -> Int {
        dict[snap_id]![index]
    }
}

//O(len * log snap), O(len+snap)
class SnapshotArray {
    var snaps = [[[Int]]]()
    var id = 0
    init(_ length: Int) {
        for i in 0..<length {
            snaps.append([[0,0]])
        }
    }
    
    func set(_ index: Int, _ val: Int) {
        snaps[index].append([id, val])
    }
    
    func snap() -> Int {
        id += 1
        return id-1
    }
    
    func get(_ index: Int, _ snap_id: Int) -> Int {
        let snap = snaps[index]
        var l=0,r=snap.endIndex-1
        while l<r {
            let mid = (l+r+1)/2 //l+(r-l+1)>>1
            if snap[mid][0] <= snap_id {
                l = mid
            } else {
                r = mid-1
            }
        }

        return snap[l][1]
    }
}
