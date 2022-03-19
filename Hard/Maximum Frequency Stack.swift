//Maximum Frequency Stack
// space O(n)
class FreqStack {
    var freq = [Int: Int]()
    var freqToStack = [Int: [Int]]()
    var maxFreq = 0
    
    func push(_ val: Int) {
        freq[val, default: 0] += 1
        let freq = freq[val]!
        if freq > maxFreq {
            maxFreq = freq
        }
        freqToStack[freq, default: []].append(val)
    }
    
    func pop() -> Int {
        let val = freqToStack[maxFreq]!.removeLast()
        freq[val]! -= 1
        if freqToStack[maxFreq]!.count == 0 {
            maxFreq -= 1
        }
        return val
    }
}