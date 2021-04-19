//Combination Sum IV
//O(n!)
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        var res = 0
        func dfs(_ curr: Int) {
            if curr == 0 {
                res += 1
                return
            }
            for n in nums {
                if curr - n >= 0 {
                    dfs(curr - n)
                }
            }
        }
        dfs(target)
        return res
    }
//O(n) O(n)
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        
        var dict = [Int:Int]()
        func dfs(_ curr: Int) -> Int {
            if curr == 0 {
                return 1
            }
            if dict[curr] != nil {
                return dict[curr]!
            }
            var count = 0
            for n in nums {
                if curr - n >= 0 {
                    count += dfs(curr - n)
                }
            }
            dict[curr] = count
            return count
        }

        return dfs(target)
    }
let input = [4,2,1]
let input2 = 32
// let input = [1,2,3]
// let input2 = 4

print(combinationSum4(input, input2))