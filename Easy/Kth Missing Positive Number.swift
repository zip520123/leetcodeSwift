//Kth Missing Positive Number
//O(n) O(1)
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var curr = 0, n = 1
        var index = 0
        while curr < k {
            if index < arr.endIndex && arr[index] == n {
                index += 1
                n += 1
            } else {
                curr += 1
                if curr == k {
                    return n
                }
                n += 1
            }
        }
        return -1
    }

//O(log n) O(1)
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var l = 0, r = arr.endIndex - 1
        while l <= r {
            let mid = (l+r)>>1
            if arr[mid] - mid - 1 < k {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return l + k
    }
//O(log n) O(1)
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        let n = arr.endIndex
        if arr[n-1] - n < k { 
            return arr[n-1] + (k - (arr[n-1]-n))
        }
        if arr[0] - 1 >= k {
            return k
        }
        var l = 0, r = arr.endIndex - 1
        while l < r {
            let mid = (l+r)>>1
            if arr[mid] - (mid + 1) < k {
                l = mid+1
            } else {
                r = mid
            }
        }
        
        return arr[l-1] + (k - (arr[l-1]-l))
    }