//Single Number III
//O(n), O(n)
    func singleNumber(_ nums: [Int]) -> [Int] {
        var set = Set<Int>()
        for n in nums {
            if set.contains(n) {
                set.remove(n)
            } else {
                set.insert(n)
            }
        }
        return Array(set)
    }

//O(n),O(1)
    func singleNumber(_ nums: [Int]) -> [Int] {
        let aXORb = nums.reduce(0, ^)
        let rightSetBit = aXORb & -aXORb
        var a = 0
        for n in nums {
            if n & rightSetBit != 0 {
                a = a^n
            }
        }
        return [a, a ^ aXORb]
    }