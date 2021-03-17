/*Time Based Key-Value Store*/
class TimeMap {
    var dict = Dictionary<String, [(Int,String)]>()
    //O(1)
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        dict[key, default: []].append((timestamp, value))
        
    }
    //time O(n)
    func get(_ key: String, _ timestamp: Int) -> String {
        return dict[key]?.last(where: {
            $0.0 <= timestamp
        })?.1 ?? ""
    }
}

class TimeMap {
    var dict = Dictionary<String, [(Int,String)]>()

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        dict[key, default: []].append((timestamp, value))
        
    }
    
    func get(_ key: String, _ timestamp: Int) -> String {
        if let arr = dict[key] {
            let index = binarySearch(arr, timestamp)
            if index == -1 {
                return ""
            } else {
                return arr[index].1
            }
        } else {
            return ""
        }
    }
    
        
    func binarySearch(_ nums: [(Int, String)], _ target: Int) -> Int {
        var lo = 0
        var hi = nums.count - 1
        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            if nums[mid].0 == target {
                return mid
            } else if nums[mid].0 > target {
                hi = mid - 1
            } else {
                lo = mid + 1
            }
        }
        return lo-1
    }
}