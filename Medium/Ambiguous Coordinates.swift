//Ambiguous Coordinates
class Solution {
    func ambiguousCoordinates(_ s: String) -> [String] {
        var sArr = Array(s)
        sArr.removeLast()
        sArr.removeFirst()
        
        func gen(_ s: String) -> [String] {

            let sArr = Array(s)
            if sArr.endIndex == 1 {return [s]}
            var res = [String]()
            next: for i in 1...sArr.endIndex {
                var left = String(sArr[0..<i])
                var right = String(sArr[i...])
                if right == "" {
                    let leftNum = Int(left)!
                    if Array(left)[0] == "0" {continue next}
                    res.append(String(left))
                } else {
                    let leftNum = Int(left)!, rightNum = Int(right)!
                    if leftNum == 0 && left.count > 1 {continue next}
                    if rightNum == 0 {continue next}
                    if Array(right)[right.count-1] == "0" {continue next}
                    if Array(left)[0] == "0" && leftNum > 0 {continue next}
                    
                    res.append(left+"."+right) 
                }

            }
            return res
        }
        var res = [String]()
        for i in 1..<sArr.endIndex {
            let w1 = String(sArr[0..<i])
            let w2 = String(sArr[i...])
            let w1list = gen(w1), w2list = gen(w2)
            for left in w1list {
                for right in w2list {
                    
                    res.append("(\(left), \(right))")
                }
            }
        }

        return res
    }
}