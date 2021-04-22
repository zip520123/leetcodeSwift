//Random Pick with Weight
//O(n) O(n)
class Solution {
    let totalW : Int
    let prefix :[Int]
    init(_ w: [Int]) {
        var arr = w
        var i = 1 
        while i < arr.endIndex {
            arr[i] += arr[i-1]
            i += 1
        }
        self.totalW = arr.last!
        self.prefix = arr
    }
    
    func pickIndex() -> Int {
        if totalW == 0 {return 0}
        let offset = Int.random(in: 1...totalW)
        var i = 0 
        while prefix[i] < offset {
            i += 1
        }
        return i
        
    }
}
//O(n log n) O(n)
class Solution {
    let totalW : Int
    let prefix :[Int]
    init(_ w: [Int]) {
        var arr = w
        var i = 1 
        while i < arr.endIndex {
            arr[i] += arr[i-1]
            i += 1
        }
        self.totalW = arr.last!
        self.prefix = arr
    }
    
    func pickIndex() -> Int {
        if totalW == 0 {return 0}
        let offset = Int.random(in: 1...totalW)
        var l = 0, r = prefix.endIndex - 1
        while l < r {
            let mid = (l+r)>>1
            if prefix[mid] < offset {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return l
    }
}

class Solution {
    let items: [Int] //space O(100)
    
    init(_ w: [Int]) { //O(n)
        var arr = [Int]()
        let total = Double(w.reduce(0,+))
        for (i,n) in w.enumerated() {
            let prob = Int(Double(n) / total * 100)
            for _ in 0..<prob {
                arr.append(i)
            }
        }
        self.items = arr
    }
    
    func pickIndex() -> Int { //O(1)
        if items.endIndex == 0 {return 0}
        return items[Int.random(in:0..<items.endIndex)]
    }
}
