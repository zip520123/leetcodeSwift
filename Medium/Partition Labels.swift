/*Partition Labels*/
func partitionLabels(_ S: String) -> [Int] {
    var dict = [Character:Int]()
    let sArr = Array(S)
    for (i,char) in sArr.enumerated() {
        dict[char] = i
    }
    var res = [Int]()
    var left = 0, right = 0, bound = 0
    while right < sArr.endIndex {
        bound = max(bound, dict[sArr[right]]!)
        if bound == right {
            res.append(right - left + 1)
            left = right + 1
        }
        right += 1
    }
    return res
}