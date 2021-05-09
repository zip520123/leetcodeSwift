//Construct Target Array With Multiple Sums
//O(n log n) O(n)
    func isPossible(_ target: [Int]) -> Bool {
        if target.endIndex == 1 {
            return target[0] == 1
        }
        var sum = target.reduce(0,+)
        var arr = target.sorted(by:<)
        while arr.last! > 1 {
            let largest = arr.last!
            let x = largest - (sum-largest)
            if x < 1 {return false}
            arr.removeLast()
            sum = sum-largest+x
            var l = 0, r = arr.endIndex
            while l<r {
                let mid = (l+r)>>1
                if arr[mid] < x {
                    l = mid + 1
                } else {
                    r = mid 
                }
            }
            arr.insert(x, at:l)
        }
        return true
    }
//O(log k * log n) n = target.len, k = max(target)
    func isPossible(_ target: [Int]) -> Bool {
        if target.endIndex == 1 {
            return target[0] == 1
        }
        var sum = target.reduce(0,+)
        var arr = target.sorted(by:<)
        while arr.last! > 1 {
            let largest = arr.last!
            let rest = sum - largest
            if rest == 1 {return true}
            let x = largest % rest
            if x == 0 || x == largest {return false}
            
            arr.removeLast()
            sum = sum-largest+x
            
            var l = 0, r = arr.endIndex
            while l<r {
                let mid = (l+r)>>1
                if arr[mid] < x {
                    l = mid + 1
                } else {
                    r = mid 
                }
            }
            arr.insert(x, at:l)
        }
        return true
    }