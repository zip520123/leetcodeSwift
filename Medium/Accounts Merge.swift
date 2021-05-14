//Accounts Merge
//O(n^2) set brute force merge
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

    //BFS O(N log N), n = sum(account.emails.len), k = accounts
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var graph = [String:[String]]()
        var emailToName = [String: String]()
        for acc in accounts {
            let name = acc[0]
            let email = acc[1]
            emailToName[email] = name
            for other in acc[1...] {
                emailToName[other] = name
                graph[email, default:[]].append(other)
                graph[other, default:[]].append(email)
            }
            
        }
        var seen = Set<String>()
        var res = [[String]]()
        for email in graph.keys {
            if !seen.contains(email) {
                seen.insert(email)
                var queue = [email]
                var emails = [String]()
                while !queue.isEmpty {
                    let curr = queue.removeFirst()
                    emails.append(curr)
                    for nei in graph[curr, default:[]] {
                        if !seen.contains(nei) {
                            seen.insert(nei)
                            queue.append(nei)
                        }
                    }
                }
                res.append([emailToName[email]!] + emails.sorted())
            }
        }
        return res
    }

//Union find email as unit, O(N log N), N = sum(account.mails.len)
class Solution {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var emailToID = [String:String]()
        var emailToName = [String:String]()
        func find(_ email: String) -> String {
            if emailToID[email, default: email] == email {return email}
            emailToID[email] = find(emailToID[email]!)
            return emailToID[email]!
        }
        func union(_ node1:String, _ node2: String) {
            let root1 = find(node1)
            let root2 = find(node2)
            emailToID[root1] = root2
        }
        
        for acc in accounts {
            let name = acc[0]
            for email in acc[1...] {
                emailToName[email] = name
                union(acc[1],email)
            }
        }
        var rootToMails = [String: [String]]()
        for (email, name) in emailToName {
            let root = find(email)
            rootToMails[root, default:[]].append(email)
        }
        var res = [[String]]()
        for (rootMail, mails) in rootToMails {
            let name = emailToName[rootMail]!
            res.append([name] + mails.sorted())
        }
        return res
    }
}

//Union find email as unit, O(N log N), N = sum(account.mails.len)
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var emailToID = [String:Int]()
        var emailToName = [String:String]()
        
        var parent = [Int: Int]()
        func find(_ id: Int) -> Int {
            if parent[id, default: id] == id {return id}
            parent[id] = find(parent[id]!)
            return parent[id]!
        }
        
        func union(_ node1:Int, _ node2: Int) {
            let root1 = find(node1)
            let root2 = find(node2)
            parent[root1] = root2
        }
        
        var id = 0
        for acc in accounts {
            let name = acc[0]
            for email in acc[1...] {
                emailToName[email] = name
                if emailToID[email] == nil {
                    emailToID[email] = id
                    id += 1
                }
                union(emailToID[acc[1]]!, emailToID[email]!)
            }
        }
        var rootToEmails = [Int: [String]]()
        for (email, name) in emailToName {
            let root = find(emailToID[email]!)
            rootToEmails[root, default:[]].append(email)
        }
        var res = [[String]]()
        for (_, emails) in rootToEmails {
            let name = emailToName[emails.first!]!
            res.append([name] + emails.sorted())
        }
        return res
    }

//Union find account as unit, O(N log N), N = accounts.len, email's default id is account index.
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var emailToName = [String: String]()
        var accountRoot = [Int: Int]()
        for i in 0..<accounts.endIndex {
            accountRoot[i] = i
        }
        func find(_ id: Int) -> Int {
            if accountRoot[id]! == id {return id}
            accountRoot[id] = find(accountRoot[id]!)
            return accountRoot[id]
        }
        func union(_ node1: Int,_ node2: Int) {
            let root1 = find(node1), root2 = find(node2)
            accountRoot[root1] = root2
        }
        
        var emailToAccountIndex = [String: Int]()
        for (i,acc) in accounts.enumerated() {
            let name = acc[0]
            for email in acc[1...] {
                emailToName[email] = name
                if let index = emailToAccountIndex[email] {
                    union(i, index)
                } else {
                    emailToAccountIndex[email] = i
                }
            }
        }
        
        var rootToEmails = [Int: [String]]()
        for (email, _) in emailToName {
            let rootAccountIndex = find(emailToAccountIndex[email]!)
            rootToEmails[rootAccountIndex, default:[]].append(email)
        }
        var res = [[String]]()
        for (index, emails) in rootToEmails {
            let name = emailToName[emails.first!]!
            res.append([name] + emails.sorted())
        }
        return res
    }

    //O(n log n), O(n), n = accounts.emails.len
        func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var emailToName = [String: String]()
        var emailToRoot = [String: String]() 
        func union(_ email1: String, _ email2: String) {
            let root1 = find(email1), root2 = find(email2)
            emailToRoot[root1] = root2
        }
        for acc in accounts {
            let name = acc[0]
            let rootMail = acc[1]
            for email in acc[1...] {
                emailToName[email] = name
                union(rootMail, email)
            }
        }
        func find(_ email: String) -> String {
            if emailToRoot[email, default: email] == email {
                return email
            }
            emailToRoot[email] = find(emailToRoot[email]!)
            return emailToRoot[email]!
        }

        var rootToEmails = [String: Set<String>]()
        for (email, name) in emailToName {
            let root = find(email)
            rootToEmails[root, default:[]].insert(email)
        }
        var res = [[String]]()
        for (root, emails) in rootToEmails {
            res.append([emailToName[root]!] + emails.sorted())
        }
        return res
    }