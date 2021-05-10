//Count Primes
//O(n log log n), O(n)
class Solution {
    func countPrimes(_ n: Int) -> Int {
        var isPrime = (0..<n).map {_ in true}
        var i = 2
        while i * i < n {
            if isPrime[i] {
                var j = i*i
                while j < n {
                    isPrime[j] = false
                    j += i
                }
            }
            i += 1
        }
        var count = 0
        i = 2 
        while i < n {
            if isPrime[i] {
                count += 1
            }
            i += 1
        }
        
        return count
    }
}