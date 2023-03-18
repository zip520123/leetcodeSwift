//Design Browser History

class BrowserHistory {
    var curr: String
    var history = [String](), future = [String]() //O(n)
    init(_ homepage: String) {
        curr = homepage
    }
    
    func visit(_ url: String) { //O(n)
        history.append(curr)
        curr = url
        future.removeAll()
    }
    
    func back(_ steps: Int) -> String { //O(n)
        var steps = steps
        while steps > 0 && !history.isEmpty {
            future.append(curr)
            curr = history.removeLast()
            steps -= 1
        }
        return curr
    }
    
    func forward(_ steps: Int) -> String { //O(n)
        var steps = steps

        while steps > 0 && !future.isEmpty {
            history.append(curr)
            curr = future.removeLast()
            steps -= 1
        }
        return curr
    }
}
