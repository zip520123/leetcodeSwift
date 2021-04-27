//Nested List Weight Sum II
//O(n) O(n)
    func depthSumInverse(_ nestedList: [NestedInteger]) -> Int {
        var sum = 0, maxDepth = 0
        var queue = nestedList
        while queue.isEmpty == false {
            let temp = queue
            queue.removeAll()
            maxDepth += 1
            for nest in temp {
                if nest.isInteger() == false {
                    queue += nest.getList()
                }
            }
        }
        
        func dfs(_ currDepth: Int, _ nest: NestedInteger) {
            if nest.isInteger() {
                sum += (maxDepth - currDepth) * nest.getInteger() 
            } else {
                nest.getList().map { dfs(currDepth+1, $0) }
            }
        }
        
        for nest in nestedList {
            dfs(0,nest)
        }
        return sum
    }
//O(n) O(n) one pass
    func depthSumInverse(_ nestedList: [NestedInteger]) -> Int {
        var sum = 0
        var queue = nestedList
        var unweight = 0
        while queue.isEmpty == false {
            let temp = queue
            queue.removeAll()
            
            for nest in temp {
                if nest.isInteger() == false {
                    queue += nest.getList()
                } else {
                    unweight += nest.getInteger()
                }
            }
            sum += unweight
        }
        
        return sum
    }