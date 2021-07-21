//Push Dominoes
//O(n), O(n)
func pushDominoes(_ dominoes: String) -> String {
        var res = ""
        var stack = [Character]()
        for char in dominoes {
            switch char {
                case ".":
                    stack.append(".")
                case "L":
                    if let first = stack.first {
                        if first == "." {
                            for _ in 0...stack.endIndex {
                                res += "L"
                            }    
                        } else if first == "R" {
                            for _ in 0..<(stack.endIndex+1)/2 {
                                res += "R"
                            }
                            if (stack.endIndex+1) % 2 == 1 {
                                res += "."
                            }
                            for _ in 0..<(stack.endIndex+1)/2 {
                                res += "L"
                            }
                        }
                    } else {
                        res += "L"
                    }
                    stack.removeAll()
                case "R":
                    if let first = stack.first, first == "R" {
                        for _ in 0..<stack.endIndex {
                            res += "R"
                        }
                    } else {
                        res += String(stack)    
                    }
                    stack.removeAll()
                    stack.append("R")
                default:
                    break
            }
        }
        if let first = stack.first, first == "R" {
            for _ in 0..<stack.endIndex {
                res += "R"
            }
        } else {
            res += String(stack)    
        }
        
        return res
    }