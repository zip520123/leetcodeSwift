//Accounts Merge
//O(n^2)
func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var accounts = accounts.sorted(by:{
            a, b in
            a[0] < b[0]
        })
        var res = [[String]]()
        
        while accounts.endIndex > 0 {
            var account = accounts.removeFirst()
            let name = account[0]
            var emails = Set(account[1...])
            var i = 0
            while i < accounts.endIndex {
                let anotherAccount = accounts[i]
                let anotherName = anotherAccount[0]
                let anotherEmails = Set(anotherAccount[1...])
                if name == anotherName {
                    if emails.isDisjoint(with: anotherEmails) == false {
                        emails = emails.union(anotherEmails)
                        accounts.remove(at: i)
                        i = 0
                    } else {
                        i += 1
                    }  
                } else {
                    break  
                }
                
            }

            res.append([name] + Array(emails).sorted())
        }
        
        return res
    }