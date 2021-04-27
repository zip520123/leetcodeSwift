//Validate IP Address
class Solution {
    func validIPAddress(_ IP: String) -> String {
        var ipArr = Array(IP)
        var count = 0
        for i in 0..<ipArr.endIndex {
            if ipArr[i] == "." {ipArr[i] = ":"}
            if ipArr[i] == ":" {count += 1}
        }
        if count != 3 && count != 7 {return "Neither"}
        var arr = String(ipArr).split(separator:":")
        switch arr.endIndex {
            case 4: //IPv4
                var set = Set<Character>("0123456789")
                for s in arr {
                    let sArr = Array(s)
                    if sArr[0] == "0" && sArr.endIndex > 1 {
                        return "Neither"
                    }
                    for char in s {
                        if set.contains(char) == false {
                            return "Neither"
                        }    
                    }
                    if let n = Int(s) {
                        if n > 255 {
                            return "Neither"
                        }    
                    } else {
                        return "Neither"
                    }
                }
                return "IPv4"
            case 8: //IPv6
                var set = Set<Character>("0123456789ABCDEFabcdef")
                for s in arr {
                    let sArr = Array(s)
                    if sArr.endIndex > 4 { return "Neither" }
                    for char in s {
                        if set.contains(char) == false {
                            return "Neither"
                        }
                    }
                }
                return "IPv6"
            default:
                return "Neither"
        }
    }
}