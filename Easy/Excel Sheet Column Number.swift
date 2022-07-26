//Excel Sheet Column Number
//O(n), O(n)
    func titleToNumber(_ columnTitle: String) -> Int {
        var dict = [Character: Int]()
        
        for (index,char) in "ABCDEFGHIJKLMNOPQRSTUVWXYZ".enumerated() {
            dict[char] = index+1
        }
        
        var res = 0
        let arr = Array(columnTitle.reversed())
        for i in 0..<arr.endIndex {
            let char = arr[i]
            
            res += Int(truncating: pow(26, i) as NSDecimalNumber) * dict[char]!
        }
        return res
    }