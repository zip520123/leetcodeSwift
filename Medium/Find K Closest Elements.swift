//Find K Closest Elements
//O(n log n + k log k), O(n)
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        let res = arr.sorted { a, b in 
                              let a1 = abs(a-x) 
                              let b1 = abs(b-x)
                              if a1 != b1 {return a1 < b1}
                              return a<b
                             }
        return Array(res[0..<k]).sorted()
    }

//O(log (n-k) + k), O(1)
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        
        var l = 0, r = arr.endIndex - k
        while l<r {
            let mid = (l+r)>>1
            if x-arr[mid] > arr[mid+k]-x {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return Array(arr[l..<l+k])
    }

//O(log n + k), O(1)
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var l = 0, r = arr.endIndex-1
        while l<r {
            let m = (l+r)>>1
            if arr[m] < x {
                l = m + 1
            } else {
                r = m
            }
        }
        l -= 1
        while r-l-1 < k {
            if l >= 0 && r < arr.endIndex {
                if abs(arr[l]-x) <= abs(arr[r]-x) {
                    l -= 1
                } else {
                    r += 1
                }
            } else if l >= 0 {
                l -= 1
            } else if r < arr.endIndex {
                r += 1
            }
        }
        return Array(arr[l+1..<r])
    }