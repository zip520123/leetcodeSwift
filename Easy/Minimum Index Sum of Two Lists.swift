//Minimum Index Sum of Two Lists
//O(n^2) O(n)
    func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
        var dict = [Int:[String]]()
        for (i,item1) in list1.enumerated() {
            for (j,item2) in list2.enumerated() {
                if item1 == item2 {
                    dict[i+j, default:[]].append(item1)
                }
            }
        }
        var i = Int.max
        var res = [String]()
        for (key,value) in dict {
            if key < i {
                i = key
                res = value
            }
        }
        return res
    }
//O(n) O(n)
    func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
        var dict = [Int:[String]]()
        var list1Dict = [String:Int]()
        for (i,item) in list1.enumerated() {
            list1Dict[item] = i
        }
        for (j,item2) in list2.enumerated() {
            if let i = list1Dict[item2] {
                dict[i+j,default:[]].append(item2)
            }
        }
        
        var i = Int.max
        var res = [String]()
        for (key,value) in dict {
            if key < i {
                i = key
                res = value
            }
        }
        return res
    }