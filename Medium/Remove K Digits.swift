//Remove K Digits
//O(n), O(n)
    func removeKdigits(_ num: String, _ k: Int) -> String {
        var stack = [Int]()
        var count = k
        for char in num {
            let n = Int(String(char))!
            while let last = stack.last, last > n, count > 0 {
                stack.removeLast()
                count -= 1
            }
            if stack.isEmpty && n == 0 { continue }
            stack.append(n)
        }

        while count > 0 && !stack.isEmpty {
            stack.removeLast()
            count -= 1
        }
        
        let res = stack.map { String($0) }.joined()
        return res != "" ? res : "0"
    }