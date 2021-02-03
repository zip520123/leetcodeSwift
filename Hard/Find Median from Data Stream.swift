/*Find Median from Data Stream*/
class MedianFinder {

    private var arr = [Int]()
    
    func addNum(_ num: Int) {
        //O (log n) insert sort
        var left = 0, right = arr.endIndex
        while left < right {
            let mid = left + (right - left) / 2
            if arr[mid] < num {
                left = mid + 1
            } else {
                right = mid
            }   
        }
        arr.insert(num, at: left)
    }
    
    func findMedian() -> Double {
        //O (1)
        if arr.endIndex % 2 == 1 {
            return Double(arr[arr.endIndex / 2])
        } else {
            let n = arr[arr.endIndex / 2]
            let n2 = arr[arr.endIndex / 2 - 1]
            return (Double(n) + Double(n2)) / 2
        }
    }
}

class MedianFinder {
    var arr = [Int]()
    
    func addNum(_ num: Int) {
        var left = 0, right = arr.endIndex
        
        while left < right {
            let mid = left + (right - left) >> 1
            if arr[mid] < num {
                left = mid + 1
            } else {
                right = mid
            }
            
        }
        arr.insert(num, at: left)
    }
    
    func findMedian() -> Double {
        if arr.endIndex % 2 == 1 {
            return Double(arr[arr.endIndex >> 1])
        } else {
            let n1 = Double(arr[arr.endIndex >> 1])
            let n2 = Double(arr[arr.endIndex >> 1 - 1])
            return n1 + (n2 - n1) / 2
        }
    }
}