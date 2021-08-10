//Flip String to Monotone Increasing
//O(n), O(1)
/*
Skip 0's until we encounter the first 1.
Keep track of number of 1's in onesCount (Prefix).
Any 0 that comes after we encounter 1 can be a potential candidate for flip. Keep track of it in flipCount.
If flipCount exceeds oneCount - (Prefix 1's flipped to 0's)
a. Then we are trying to flip more 0's (suffix) than number of 1's (prefix) we have.
b. Its better to flip the 1's instead.
*/
    func minFlipsMonoIncr(_ s: String) -> Int {
        var flipCount = 0, ocount = 0
        var p = 0
        let sArr = Array(s)
        while p < sArr.endIndex && sArr[p] == "0"{
            p += 1
        }
        for i in p..<sArr.endIndex {
            if sArr[i] == "0" {
                flipCount += 1
            } else {
                ocount += 1
            }
            if flipCount > ocount {
                flipCount = ocount
            }
        }
        return flipCount
    }