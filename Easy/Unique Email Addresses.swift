//Unique Email Addresses
//O(n), O(n)
    func numUniqueEmails(_ emails: [String]) -> Int {
        var set = Set<String>()
        
        for email in emails {
            
            let arr = email.split(separator: "@")
            let local = arr[0], domain = arr[1]
            var s = ""
            local: for char in local {
                switch char {
                    case ".":
                        break
                    case "+":
                        break local
                    default:
                        s += String(char)
                }
            }
            s += "@\(domain)" 
            set.insert(s)
        }
        return set.count
    }