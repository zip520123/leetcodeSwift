//Add to Array-Form of Integer
//O(n), O(n)
    func addToArrayForm(_ num: [Int], _ k: Int) -> [Int] {
        var arr1 = [Int]()
        var k = k
        while k > 0 {
            let curr = k % 10
            arr1.append(curr)
            k /= 10
        }
        let arr2 = Array(num.reversed())
        var carry = 0
        var i = 0
        var res = [Int]()
        while i<arr1.endIndex, i<arr2.endIndex {
            let curr = arr1[i] + arr2[i] + carry
            res.append(curr%10)
            carry = curr/10
            i += 1
        }

        while i<arr1.endIndex {
            let curr = arr1[i] + carry
            res.append(curr%10)
            carry = curr/10
            i += 1
        }

        while i<arr2.endIndex {
            let curr = arr2[i] + carry
            res.append(curr%10)
            carry = curr/10
            i += 1
        }
        if carry != 0 {
            res.append(carry)
        }
        return Array(res.reversed())
    }