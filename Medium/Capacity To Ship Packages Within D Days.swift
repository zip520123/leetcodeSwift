//Capacity To Ship Packages Within D Days
//O(n log n), O(1)
class Solution {
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        var total = 0, maxLoad = 0
        for w in weights {
            maxLoad = max(maxLoad, w)
            total += w
        }

        func feaible(_ capacity: Int) -> Bool {
            var daysNeeded = 1, curr = 0
            for w in weights {
                curr += w
                if curr > capacity {
                    daysNeeded += 1
                    curr = w
                }
            }
            return daysNeeded <= days
        }

        var l = maxLoad, r = total
        while l<r {
            let mid = l+(r-l)>>1
            if feaible(mid) {
                r = mid
            } else {
                l = mid+1
            }
        }
        return l
    }
}
