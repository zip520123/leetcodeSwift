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
