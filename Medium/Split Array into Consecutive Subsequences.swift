//Split Array into Consecutive Subsequences
//O(n), O(n)
    func isPossible(_ nums: [Int]) -> Bool {
        var left = [Int: Int](), end = [Int: Int]()
        for n in nums {
            left[n, default:0] += 1
        }
        for i in nums {
            if left[i,default: 0] == 0 {continue}
            left[i]! -= 1
            if end[i-1, default:0] > 0 {
                end[i-1]! -= 1
                end[i,default:0] += 1
            } else if left[i+1, default:0] > 0 && left[i+2,default:0] > 0 {
                left[i+1]!-=1
                left[i+2]!-=1
                end[i+2,default:0]+=1
            }else{
                return false
            }
        }
        return true
    }