//Reverse Words in a String
//O(n), O(n)
    func reverseWords(_ s: String) -> String {
        let list = s.split(separator: " ")
        return list.reversed().joined(separator: " ")
    }