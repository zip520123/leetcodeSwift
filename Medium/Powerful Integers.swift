//Powerful Integers
//log x * log y, take care case 1
    func powerfulIntegers(_ x: Int, _ y: Int, _ bound: Int) -> [Int] {
        var x = x, y = y
        if y > x {
            (x,y) = (y,x)
        }
        var res = [Int]()
        if x == 1 && y == 1 {
            if bound >= 2 {
                res.append(2)
            }
            return res
        }
        if y == 1 {
            var x1 = 1
            while x1 + 1 <= bound {
                res.append(x1+1)
                x1 *= x
            }
            return res
        }
        
        
        var set = Set<Int>()
        var x1 = 1
        while x1 <= bound {  //log x * log y
            var y1 = 1
            while x1 + y1 <= bound { 
                set.insert(x1+y1)
                y1 *= y
            }
            x1 *= x
        }
        return Array(set)
    }
//log x * log y
    func powerfulIntegers(_ x: Int, _ y: Int, _ bound: Int) -> [Int] {
        var set = Set<Int>()
        var i = 1
        
        while i <= bound {
            var j = 1 
            while i+j <= bound {
                set.insert(i+j)
                if y == 1 {break}
                j *= y
            }
            
            if x == 1 {break}
            i *= x
        }
        return Array(set)
    }