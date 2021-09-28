//Sort Array By Parity II
//O(n), O(n)
    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
        var i = 0, j = nums.endIndex-1
        var res = [Int]()
        for n in nums{
            if n % 2 == 1 {
                res.insert(n, at: 0)
            } else {
                res.append(n)
            }
        }
        while i < j {
            if res[i] % 2 != i % 2 {
                (res[i],res[j]) = (res[j],res[i])
                while res[j] % 2 == j % 2 && j > i {
                    j -= 1
                }
            }
            i += 1
        }    
        return res
    }

//O(n), O(1)
    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
        var i = 0, j = 1
        var res = nums
        let n = nums.endIndex
        while i < n && j < n {
            while i<n && res[i] % 2 == 0 {
                i += 2
            }
            while j<n && res[j] % 2 == 1 {
                j += 2
            }
            if i<n && j<n {
                res.swapAt(i,j)
            }
        }
        return res
    }