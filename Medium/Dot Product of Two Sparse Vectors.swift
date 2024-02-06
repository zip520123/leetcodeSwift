//Dot Product of Two Sparse Vectors
class SparseVector {
    let nums : [Int]
    init(_ nums: [Int]) {
       self.nums = nums 
    }

    // Return the dotProduct of two sparse vectors
    func dotProduct(_ vec: SparseVector) -> Int {
        var res = 0
        for (n1,n2) in zip(self.nums,vec.nums) {
            res += n1 * n2
        }
        return res
    }
}

//hash
class SparseVector {
    
    let dict: [Int:Int] 
    init(_ nums: [Int]) {
        var dict:[Int:Int] = [:]
       for (i,n) in nums.enumerated() {
           dict[i] = n
       }
        self.dict = dict
    }

    // Return the dotProduct of two sparse vectors
    func dotProduct(_ vec: SparseVector) -> Int {
        var res = 0
        for (key,val) in dict {
            if let n = vec.dict[key] {
                res += n * val
            }
        } 
        return res
    }
}

class SparseVector {
    private(set) var memo = [Int: Int]()
    init(_ nums: [Int]) {
        for i in 0..<nums.endIndex {
            memo[i, default: 0] = nums[i]
        }
    }

    func dotProduct(_ vec: SparseVector) -> Int {
        var res = 0
        for (key, val) in vec.memo {
            res += self.memo[key, default: 0] * val
        }
        return res
    }
}