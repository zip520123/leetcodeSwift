//Combination Sum II
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        let nums = candidates.sorted()
        
        func dfs(_ curr:Int, _ index: Int, _ path:[Int]) {
            if curr < 0 {return }
            else if curr == 0 {
                res.append(path)
            } else {
                var i = index
                while i < nums.endIndex {
                    if i > index && nums[i] == nums[i-1] {
                        i+=1
                        continue
                    }
                    let n = nums[i]
                    dfs(curr-n,i+1, path+[n])
                    i += 1
                }
            }
        }
        dfs(target,0,[])
        return res
    }

    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        let nums = candidates.sorted()
        
        func dfs(_ path:[Int], _ curr: Int, _ index: Int) {
            if curr == 0 {
                res.append(path)
                return 
            }    
            var prev : Int?
            for i in index..<nums.endIndex {
                let n = curr - nums[i]
                if prev != nil && prev! == n {continue}
                prev = n
                if n >= 0 {
                    dfs(path+[nums[i]], n, i+1)
                }
            }
        }
        
        dfs([],target,0)
        return res
    }