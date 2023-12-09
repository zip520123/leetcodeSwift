// Diagonal Traverse II
// O(n), O(n)
func findDiagonalOrder(_ nums: [[Int]]) -> [Int] {
    var res = [Int]()
    let rows = nums.endIndex
    var groups = [Int:[Int]]()
    for row in (0..<rows).reversed() {
        for col in 0..<nums[row].endIndex {
            let diagonal = row + col
            groups[diagonal, default: []].append(nums[row][col])
        }
        
    }
    var curr = 0
    while groups[curr] != nil {
        for n in groups[curr]! {
            res.append(n)
        }
        curr += 1
    }
    return res
}