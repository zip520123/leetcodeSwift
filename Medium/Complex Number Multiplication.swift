//Complex Number Multiplication
//O(n1+n2), O(n1+n2)
class Solution {
    func complexNumberMultiply(_ num1: String, _ num2: String) -> String {
        let (r1, i1) = complexN(num1), (r2, i2) = complexN(num2)
        // res = r1*r2 + r1*i2 + i1 * r2 + i1 * i2
        let a = r1*r2
        let b = r1*i2 + i1*r2
        let c = i1*i2*(-1) //i^2 = -1
        
        return "\(a+c)+\(b)i"
    }
    
    func complexN(_ s: String) -> (Int, Int) {
        let sArr = String(Array(s)[0..<s.count-1]).split(separator: "+")
        let real = Int(sArr[0])!, imaginary = Int(sArr[1])!
        return (real, imaginary)
    }
}