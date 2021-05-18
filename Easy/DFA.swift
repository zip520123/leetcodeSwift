//DFA solve life trouble
/*
given a trouble of list, return true if you can solve all the trouble
"have trouble", "don't have troble" 
"can solve it", "can't solve it"
*/
enum Symbol {
    case have, dont, can, cannot
}
let dfa: [[Symbol: Int]] = [
    [.have:2, .dont:1], 
    [:],
    [.can:1, .cannot:1]
]

let input = ["have troble", "can solve it"]
func solveLifeProblem(_ list: [String]) -> Bool {
    var currStatus = 0
    for str in list {
        var currChoice: Symbol
        switch str {
            case "have troble":
                currChoice = .have
            case "don't have troble":
                currChoice = .dont
            case "can solve it":
                currChoice = .can
            case "can't solve it":
                currChoice = .cannot
            default:
                return true
        }
        if let nextStatus = dfa[currStatus][currChoice] {
            currStatus = nextStatus
        } else {
            return true
        }
    }
    switch currStatus {
        case 1: 
            return true
        default:
            return false
    }
}
print(solveLifeProblem(input))