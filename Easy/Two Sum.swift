/*Two Sum*/
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()
    for (i,n) in nums.enumerated() {
        let r = target - n
        if dict[r] != nil {
            return [dict[r]! , i]
        }
        dict[n] = i 
    }
    
    return []
}