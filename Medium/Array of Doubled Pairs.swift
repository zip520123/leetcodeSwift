//Array of Doubled Pairs
//O(n log n), O(n)
func canReorderDoubled(_ arr: [Int]) -> Bool {
    var count = [Int: Int]()
    for n in arr {
        count[n, default:0]+=1
    }
    var arr2 = arr.sorted{ a,b in abs(a)<abs(b)}
    for n in arr2 {
        if count[n]! == 0 {continue}
        if count[2*n, default:0] <= 0 {return false}
        count[n, default:0] -= 1
        count[2*n, default:0] -= 1
    } 
    return true
}