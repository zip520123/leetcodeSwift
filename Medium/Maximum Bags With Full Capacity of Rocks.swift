//Maximum Bags With Full Capacity of Rocks
//O(n log n), O(n)
    func maximumBags(_ capacity: [Int], _ rocks: [Int], _ additionalRocks: Int) -> Int {
        var count = 0

        var arr = [Int]()
        for (ca, rock) in zip(capacity, rocks) {
            let curr = ca-rock 
            if curr == 0 {
                count += 1
            } else if curr > 0 {
                arr.append(curr)
            }
        }
        
        var rocks = additionalRocks
        
        for n in arr.sorted() {
            if n <= rocks {
                count += 1
                rocks -= n
            }        
        }
        return count
    }