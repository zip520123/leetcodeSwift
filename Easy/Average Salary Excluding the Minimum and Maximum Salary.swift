//Average Salary Excluding the Minimum and Maximum Salary
//O(n log n), O(n)
    func average(_ salary: [Int]) -> Double {
        var arr = salary.sorted()
        arr.removeFirst()
        arr.removeLast()
        return Double(arr.reduce(0, +)) / Double(arr.endIndex)
    }  