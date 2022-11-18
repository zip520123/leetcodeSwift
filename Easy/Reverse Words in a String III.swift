//Reverse Words in a String III
    func reverseWords(_ s: String) -> String {
        let arr = s.split(separator: " ")
        return arr.map {String(Array($0).reversed())} .joined(separator: " ")
    }