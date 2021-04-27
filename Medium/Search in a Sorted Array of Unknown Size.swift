//Search in a Sorted Array of Unknown Size
//O(n log n) O(1)
    func search(_ reader: ArrayReader, _ target: Int) -> Int {
        var l = 0, r = 10000
        while l < r {
            let mid = (l+r)>>1
            if reader.get(mid) != 2147483647 {
                l = mid + 1
            } else {
                r = mid
            }
        }
        let bound = l
        l = 0; r = bound 
        while l < r {
            let mid = (l+r) >> 1
            if reader.get(mid) < target {
                l = mid+1
            } else {
                r = mid
            }
        }
        if reader.get(l) == target {
            return l
        } else {
            return -1
        }
    }

    func search(_ reader: ArrayReader, _ target: Int) -> Int {
        var l = 0, r = 1
        while reader.get(r) < target {
            l = r
            r <<= 1
        }
        
        while l < r {
            let mid = (l+r) >> 1
            if reader.get(mid) < target {
                l = mid+1
            } else {
                r = mid
            }
        }
        if reader.get(l) == target {
            return l
        } else {
            return -1
        }
    }