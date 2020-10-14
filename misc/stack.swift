public struct Stack<T>{
    private var arr = [T]()
    var count: Int {
        return arr.count
    }
    mutating func push(_ item: T) {
        arr.append(item)
    }

    mutating func pop() -> T? {
        return arr.removeLast()
    }

    var top: T? {
        return arr.last
    }
}
var stack = Stack<Int>()
print(stack.count)
print(stack.top)
stack.push(10)
stack.push(12)
print(stack.top)
print(stack.pop())
print(stack.top)