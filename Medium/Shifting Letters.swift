//Shifting Letters
//O(n), O(n)
    func shiftingLetters(_ s: String, _ shifts: [Int]) -> String {
        var curr = 0
        var offsets = [Int]()
        for shift in shifts.reversed() {
            curr = (shift + curr) % 26
            offsets.append(curr)
        }
        offsets = offsets.reversed()
        
        var res = ""
        for (i, char) in Array(s).enumerated() {
            let ascii = char.asciiValue!
            var currValue = Int(ascii)+offsets[i]
            if currValue >= 97+26 {
                currValue -= 26
            }
            let newChar = String(UnicodeScalar(UInt8( currValue ) ))
            res += newChar
        }

        return res
    }
//O(n), O(n)
    func shiftingLetters(_ s: String, _ shifts: [Int]) -> String {
        
        var newShifts = [Int]()
        var sum = 0
        for shift in shifts {
            let newShift = shift%26
            newShifts.append(newShift)
            sum += newShift
        }
        
        var res = Array(s)
        for (i, char) in res.enumerated() {
            let code = res[i].asciiValue!
            var newCode = (code + UInt8(sum%26) )
            if newCode >= 97+26 {
                newCode-=26
            }
            res[i] = Character(UnicodeScalar(UInt8( newCode ) ))
            sum -= newShifts[i]
        }

        return String(res)
    }