//time O(n log n) space O(nums)
func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var dict = Dictionary<Int,Int>()
    for n in nums {
        dict[n, default: 0] += 1
    }
    var arr = [Int]()
    for (key,_) in dict {
        arr.append(key)
    }
    let sortedArr = arr.sorted { a, b in
        return dict[a]! > dict[b]!
    }
    
    return Array(sortedArr[0..<k])
}

    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        for n in nums {
            dict[n, default:0] += 1
        }
        var list = Array(dict.keys)
        list.sort {a,b in dict[a]! > dict[b]! } 
        return Array(list[0..<k])
    }

//quick select O(n)~O(n^2), O(n), n = nums.len
        func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        for n in nums {
            dict[n, default:0] += 1
        }
        var list = Array(dict.keys)
        
        func quickSelect(_ start:Int, _ end: Int) {
            var left = start
            for i in start..<end {
                if dict[list[i]]! > dict[list[end]]! {
                    (list[i], list[left]) = (list[left], list[i])
                    left += 1
                }
            }
            (list[end], list[left]) = (list[left], list[end])
            if left + 1 == k {
                return 
            } else if left+1 > k {
                quickSelect(start,left-1)
            } else {
                quickSelect(left+1,end)
            }
        }
        quickSelect(0, list.endIndex-1)
        return Array(list[0..<k])
    }

//high order function
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        return nums
                .reduce(into: [:]) { $0[$1, default:0]+=1 }
                .sorted { $0.value > $1.value }
                .prefix(k)
                .map {$0.key}
    }