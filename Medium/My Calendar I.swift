//My Calendar I
class MyCalendar {
    var arr = [[Int]]()
    
    func book(_ start: Int, _ end: Int) -> Bool {
        var l = 0, r = arr.endIndex
        while l<r {
            let mid = (l+r)>>1
            if arr[mid][0] < start {
                l = mid + 1
            } else {
                r = mid
            }
        }
        let interval = [start, end]
        arr.insert(interval, at: l)
        if l-1 >= 0 && arr[l-1][1] > interval[0] {
            arr.remove(at: l)
            return false
        } 
        if l+1 < arr.endIndex && interval[1] > arr[l+1][0] {
            arr.remove(at: l)
            return false
        }
        return true
        
    }
}

class MyCalendar {
    var arr = [[Int]]()
    
    func book(_ start: Int, _ end: Int) -> Bool {
        var l = 0, r = arr.endIndex
        while l<r {
            let mid = (l+r)>>1
            if arr[mid][0] < start {
                l = mid + 1
            } else {
                r = mid
            }
        }
        let interval = [start, end]
        if l-1 >= 0 && arr[l-1][1] > interval[0]{
            return false
        }
        if l < arr.endIndex && interval[1] > arr[l][0] {
            return false
        }
        arr.insert(interval, at: l)
        return true
        
    }
}

//O(n log n), O(n)
class MyCalendar {
    var arr = [[Int]]()
    
    func book(_ start: Int, _ end: Int) -> Bool {
        var l = 0, r = arr.endIndex
        while l<r {
            let mid = l+(r-l)>>1
            if arr[mid][0] < start {
                l = mid+1
            } else {
                r = mid
            }
        }
        let interval = [start, end]
        
        if l-1>=0, arr[l-1][1] > start {return false}
        if l < arr.endIndex, arr[l][0] < end {return false}
        
        
        arr.insert(interval,at: l)
        return true
    }
}