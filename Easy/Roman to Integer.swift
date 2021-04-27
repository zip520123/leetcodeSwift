//Roman to Integer
//O(n) O(1)
    func romanToInt(_ s: String) -> Int {
        var p = 0, res = 0
        let sArr = Array(s)
        for char in sArr.reversed() {
            var curr : Int?
            switch char {
                case "I":
                    curr = 1
                case "V":
                    curr = 5
                case "X":
                    curr = 10
                case "L":
                    curr = 50
                case "C":
                    curr = 100
                case "D":
                    curr = 500
                case "M":
                    curr = 1000
                default:
                    break
            }
            if curr! >= p {
                p = curr!
                res += curr!
            } else {
                res -= curr!
            }
        }
        return res
    }