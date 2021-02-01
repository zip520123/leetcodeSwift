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
        //O (log n)
        if arr.endIndex % 2 == 1 {
            return Double(arr[arr.endIndex / 2])
        } else {
            let n = arr[arr.endIndex / 2]
            let n2 = arr[arr.endIndex / 2 - 1]
            return (Double(n) + Double(n2)) / 2
        }
    }
}