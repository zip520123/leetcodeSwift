// Seat Reservation Manager

class SeatManager {
    private var arr: [Int]
    init(_ n: Int) {
        arr = Array(1...n)
    }
    
    func reserve() -> Int { //O(1)
        arr.removeFirst()
    }
    
    func unreserve(_ seatNumber: Int) { //O(n)
        var l = 0, r = arr.endIndex
        while l<r {
            let mid = l+(r-l)>>1
            if arr[mid] < seatNumber {
                l = mid+1
            } else {
                r = mid
            }
        }
        arr.insert(seatNumber, at: l)
    }
}

class SeatManager {
    private let heap: Heap
    init(_ n: Int) {
        heap = Heap()
        for i in 1...n {
            heap.insert(i)
        }
    }
    
    func reserve() -> Int {
        heap.removeTop()
    }
    
    func unreserve(_ seatNumber: Int) {
        heap.insert(seatNumber)
    }
}