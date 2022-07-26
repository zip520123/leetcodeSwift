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

//O(n), O(n)
class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        var dict = [Character: Int]()
        for (i,char) in s.enumerated() {
            dict[char] = i
        }
        var l = 0, r = 0, i = 0, res = [Int]()
        for i in 0..<s.count {
            r = max(r, dict[s[i]]!)
            if i == r {
                res.append(r-l+1)
                l = r+1
            }
        }
        return res
    }
}

extension StringProtocol {
    public subscript(_ offset: Int) -> Element {
        self[index(startIndex, offsetBy: offset)]
    }
}