//Global and Local Inversions
//O(n^2)
    func isIdealPermutation(_ A: [Int]) -> Bool {
        
        if A.endIndex <= 1 {return true}
        var globalMax = A[0], globalN = 0
        for i in 1..<A.endIndex {
            let n = A[i]
            for j in 0..<i {
                let prev = A[j]
                if prev > n {
                    globalN += 1
                }
            }
        }
        var prev = A[0], localN = 0
        for n in A {
            if n < prev {localN += 1}
            prev = n
        }
        return globalN == localN
    }

     func isIdealPermutation(_ A: [Int]) -> Bool {
        if A.endIndex <= 1 {return true}
        
        for i in 0..<A.endIndex-1 {
            for j in i+1 ..< A.endIndex {
                if A[j] < A[i] && j-1 != i {
                    return false
                }
            }
        }
        return true
    }
/*Let's think about the problem in an abstract way, local inversions are actually swaps between two adjacent elements only. So whenever we detect |i - A[i]| > 1, we return false.*/
func isIdealPermutation(_ A: [Int]) -> Bool {
        for i in 0..<A.endIndex {
            if abs(A[i] - i) > 1 {return false}
        }
        return true
    }
/*
If the number of global inversions is equal to the number of local inversions,
it means that all global inversions in permutations are local inversions.
It also means that we can not find A[i] > A[j] with i+2<=j.
In other words, max(A[i]) < A[i+2]

In this first solution, I traverse A and keep the current biggest number cmax.
Then I check the condition cmax < A[i+2]

*/

func isIdealPermutation(_ A: [Int]) -> Bool {
    if A.endIndex < 2 {return true}
    var gM = 0
    for i in 0..<A.endIndex - 2 {
        gM = max(A[i],gM)
        if gM > A[i+2] {return false}
    }
    
    return true
}
