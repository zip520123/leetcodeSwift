//Multiply Strings
func multiply(_ num1: String, _ num2: String) -> String {
    var arr = [Int](repeating: 0, count: num1.count + num2.count)
    let n1 = Array(num1), n2 = Array(num2)
    var i = n1.endIndex - 1
    
    while i >= 0 {
        var j = n2.endIndex - 1
        while j >= 0 {
            let mul = Int(String(n1[i]))! * Int(String(n2[j]))!
            let p1 = i+j, p2 = i+j+1
            let sum = mul + arr[p2]
            arr[p1] += sum/10
            arr[p2] = sum%10
            j -= 1
        }
        i -= 1
    }
    var res = ""
    for n in arr {
        if !(res == "" && n == 0) {
            res += String(n)
        }
    }
    return res == "" ? "0" : res
}

    func multiply(_ num1: String, _ num2: String) -> String {
        let n1 = Array(num1), n2 = Array(num2)
        var arr = [Int](repeating: 0, count: n1.endIndex + n2.endIndex)
        for i in (0..<n1.endIndex).reversed() {
            for j in (0..<n2.endIndex).reversed() {
                let mul = Int(String(n1[i]))! * Int(String(n2[j]))!
                let curr = i+j+1, ten = i+j
                let sum = arr[curr] + mul
                arr[curr] = sum % 10
                arr[ten] += sum / 10
            }
        }
        var res = ""
        for n in arr {
            if n == 0 && res == "" {continue}
            res += String(n)
        }
        return res == "" ? "0" : res
    }