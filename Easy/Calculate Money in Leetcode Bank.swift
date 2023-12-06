// Calculate Money in Leetcode Bank
// O(1), O(1)
func totalMoney(_ n: Int) -> Int {
    let lastDays = n % 7
    let weeks = n / 7
    
    let res = 28 * weeks + (0+(weeks-1)*7)*weeks/2 + (1+weeks+lastDays+weeks) * lastDays / 2
    return res
}