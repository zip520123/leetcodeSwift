// Buy Two Chocolates
// O(n log n), O(n)
func buyChoco(_ prices: [Int], _ money: Int) -> Int {
    let arr = prices.sorted()
    let p = arr[0] + arr[1] 
    if p > money {return money}
    return money - p
}