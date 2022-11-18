//Online Stock Span
//O(1), O(n)
class StockSpanner {
    private var stack = [(price: Int, res: Int)]()
    
    func next(_ price: Int) -> Int {
        var res = 1
        while !stack.isEmpty && stack.last!.price <= price {
            let curr = stack.removeLast()
            res += curr.res
        }
        stack.append((price, res))
        return res
    }
}