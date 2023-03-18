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

//
class BrowserHistory {
    var arr = [String]() //O(n)
    var curr = 0, last = 0
    init(_ homepage: String) {
        arr.append(homepage)
    }
    
    func visit(_ url: String) { //O(1)
        curr += 1
        
        if curr >= arr.endIndex {
            arr.append(url)
        } else {
            arr[curr] = url
        }
        last = curr
    }
    
    func back(_ steps: Int) -> String { //O(1)
        curr = max(0, curr-steps)
        return arr[curr]
    }
    
    func forward(_ steps: Int) -> String { //O(1)
        curr = min(last, curr+steps)
        return arr[curr]
    }
}