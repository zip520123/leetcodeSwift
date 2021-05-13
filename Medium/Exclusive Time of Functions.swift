//Exclusive Time of Functions
class Solution {
    
    enum State {
        case start(String, Int)
        case end(String, Int)
    }
    
    func exclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
        let states = makeStates(logs)
        
        var stack = [String]()
        var startTime = 0
        var dict = [String:Int]()
        for state in states {
            switch state {
                case let .start(id, time):
                    if !stack.isEmpty {
                        dict[stack.last!, default:0] += time - startTime - 1        
                    }
                    stack.append(id)
                    startTime = time

                case let .end(id, time):
                    let lastId = stack.removeLast()
                    dict[lastId, default:0] += time - startTime + 1
                    startTime = time
                
            }
        }
        var res = [Int]()
        for i in 0..<n {
            res.append(dict[String(i), default:0])
        }
        return res
    }
    
    func makeStates(_ logs: [String]) -> [State] {
        var states = [State]()
        for log in logs {
            let s = log.split(separator: ":")
            let id = s[0]
            let time = Int(s[2])!
            if s[1] == "start" {
                states.append(State.start(String(id),time))
            } else if s[1] == "end" {
                states.append(State.end(String(id),time))
            }
        }
        return states
    }
    
}

    func exclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
        var stack = [Int]()
        var res = (0..<n).map { _ in 0 }
        var startTime = 0
        for log in logs {
            let data = log.split(separator: ":")
            let id = Int(data[0])!, op = data[1], time = Int(data[2])!
            switch op {
                case "start":
                   if !stack.isEmpty {
                       let lastId = stack.last!
                       res[lastId] += time - startTime - 1
                   }
                   stack.append(id) 
                   startTime = time
                case "end":
                    let lastId = stack.removeLast()
                    res[lastId] += time - startTime + 1 
                    startTime = time
                default:
                    break
            }
        }
        return res
    }