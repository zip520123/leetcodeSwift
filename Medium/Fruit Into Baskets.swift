//Fruit Into Baskets
//O(n), O(n)
    func totalFruit(_ fruits: [Int]) -> Int {
        var l = 0, r = 0, res = 0
        var typeCount = 0
        var dict = [Int: Int]()
        while r < fruits.endIndex {
            let curr = fruits[r]
            dict[curr,default: 0] += 1
            if dict[curr]! == 1 {
                typeCount += 1
                while typeCount > 2 {
                    let left = fruits[l]
                    dict[left]! -= 1
                    if dict[left]! == 0 {
                        typeCount -= 1
                    }
                    l += 1
                }
            }
            res = max(res, r-l+1)
            r += 1
        }
        return res
    }