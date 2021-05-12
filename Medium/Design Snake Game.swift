//Design Snake Game
class SnakeGame {
    var queue = [[0,0]]
    let foods: [[Int]]
    var foodIndex = 0
    let rows : Int
    let cols: Int
    init(_ width: Int, _ height: Int, _ food: [[Int]]) {
        self.foods = food
        rows = height 
        cols = width
    }

    func move(_ direction: String) -> Int { //O(n)
        var head = queue.last!
        let tail = queue.removeFirst()
        switch direction {
            case "U":
                head[0] -= 1
            case "L":
                head[1] -= 1
            case "R":
                head[1] += 1
            case "D":
                head[0] += 1
            default:
                break
        }
        
        if head[0] < 0 || head[0] == rows || head[1] < 0 || head[1] == cols {return -1}
        var i = 0
        while i < queue.endIndex {
            let body = queue[i]
            if head == body {
                return -1
            }
            i += 1
        }
        if foodIndex == foods.endIndex {
            queue.append(head)
            return foodIndex
        }
        if head == foods[foodIndex] {
            foodIndex += 1
            queue.append(head)
            queue.insert(tail, at:0)            
        } else {
            queue.append(head)
        }
        
        return foodIndex 
    }
}

//map
class SnakeGame {
    var queue = [[0,0]]
    let foods: [[Int]]
    var foodIndex = 0
    let rows : Int
    let cols: Int
    var body = Set<[Int]>([[0,0]])
    init(_ width: Int, _ height: Int, _ food: [[Int]]) {
        self.foods = food
        rows = height 
        cols = width
    }

    func move(_ direction: String) -> Int { //O(1)
        var head = queue.last!
        let tail = queue.removeFirst()
        body.remove(tail)
        switch direction {
            case "U":
                head[0] -= 1
            case "L":
                head[1] -= 1
            case "R":
                head[1] += 1
            case "D":
                head[0] += 1
            default:
                break
        }
        
        if head[0] < 0 || head[0] == rows || head[1] < 0 || head[1] == cols {return -1}
        if body.contains(head) {return -1}
        if foodIndex == foods.endIndex {
            add(head)
            return foodIndex
        }
        if head == foods[foodIndex] {
            foodIndex += 1
            add(head)
            queue.insert(tail, at:0) 
            body.insert(tail)
        } else {
            add(head)
        }
        
        return foodIndex 
    }
    
    func add(_ position: [Int]) {
        queue.append(position)
        body.insert(position)
    }
}