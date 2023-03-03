// Find the Index of the First Occurrence in a String
//O(haystack*needle), O(haystack+needle)
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let arr1 = Array(haystack), arr2 = Array(needle)
        if arr1.endIndex < arr2.endIndex {return -1}
        next: for i in 0..<arr1.endIndex {
            var j = 0
            while j < arr2.endIndex {
                if i+j >= arr1.endIndex || arr1[i+j] != arr2[j] {
                    continue next
                }
                j += 1
            }
            return i
        }
        return -1
    }