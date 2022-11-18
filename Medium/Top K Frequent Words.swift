//Top K Frequent Words
//O(n log n), O(n)
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        var dict = [String: Int]()
        for word in words {
            dict[word, default: 0] += 1
        }
        let arr = dict.sorted { a, b in 
                               if a.value != b.value {
                                   return a.value > b.value 
                               }
                               return a.key < b.key
                              }
                        .map { $0.key }
                                
        return Array(arr.prefix(k))
    }