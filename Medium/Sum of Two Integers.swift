func getSum(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func getSum(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    while b != 0 {
        let carry = a & b
        a = a ^ b
        b = carry << 1
    }
    return a
}

func getSum_Recursive(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : getSum_Recursive(a ^ b, (a & b) << 1)
}

func getSum(_ a: Int, _ b: Int) -> Int {
    if b == 0 {return a}
    return getSum(a^b, (a&b)<<1)
}