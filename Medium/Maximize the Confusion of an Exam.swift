// Maximize the Confusion of an Exam
// O(n), O(n)
    func maxConsecutiveAnswers(_ answerKey: String, _ k: Int) -> Int {
        var res = 0
        var count = k
        let arr = Array(answerKey)
        var l = 0, r = 0
        while r<arr.endIndex {
            if arr[r] == "F" {
                count -= 1
                while count < 0 {
                    if arr[l] == "F" {
                        count += 1
                    }
                    l += 1
                }
            }
            res = max(res, r-l+1)
            r += 1
        }
        l=0;r=0;count = k
        while r<arr.endIndex {
            if arr[r] == "T" {
                count -= 1
                while count < 0 {
                    if arr[l] == "T" {
                        count += 1
                    }
                    l += 1
                }
            }
            res = max(res, r-l+1)
            r += 1
        }
        return res
    }