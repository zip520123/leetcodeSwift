//Logger Rate Limiter
//O(n)
class Logger {

    var dict = [String: Int]()

    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        let num = dict[message, default:0]
        if num <= timestamp {
            dict[message] = timestamp + 10
            return true
        } else {
            return false
        }
    }
}

class Logger {
    private var memo = [String: Int]()
    
    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        if memo[message] == nil {
            memo[message] = timestamp
            return true
        } else {
            let curr = memo[message]!
            if curr <= timestamp - 10 {
                memo[message] = timestamp
                return true
            } else {
                return false
            }
        }
    }
}