//Minimum Time to Complete Trips
//O(time * log totalTrips), O(1)
    func minimumTime(_ time: [Int], _ totalTrips: Int) -> Int {
        
        var l = 1, r = time.min()! * totalTrips
        while l<r {
            let mid = l+(r-l)>>1
            let curr = time.reduce(0, { a, n in
                return a + mid/n
            })
            if curr < totalTrips {
                l = mid+1
            } else {
                r = mid
            }
        }
        return l
    }