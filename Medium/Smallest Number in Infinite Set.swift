//Smallest Number in Infinite Set
//O(log n), O(n)
class SmallestInfiniteSet {
    var arr = [Int]()
    var set = Set<Int>()
    var currN = 1
    
    func popSmallest() -> Int {
        if !arr.isEmpty {
            let n = arr.removeFirst()
            set.remove(n)
            return n
        } else {
            let n = currN
            currN += 1
            return n
        }
    }
    
    func addBack(_ num: Int) {
        if set.contains(num) || currN <= num {
            return
        }
        var l = 0, r = arr.endIndex
        while l<r {
            let mid = l+(r-l)>>1
            if arr[mid] < num {
                l = mid+1
            } else {
                r = mid
            }
        }
        arr.insert(num, at: l) //O(n)
        set.insert(num) //O(1)
    }
}