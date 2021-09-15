//Longest Turbulent Subarray
//O(n), O(2n)
    func maxTurbulenceSize(_ arr: [Int]) -> Int {
        var up = [1]
        var down = [1]
        var res = 1
        for i in 1..<arr.endIndex {
            let n = arr[i]
            if n < arr[i-1] {
                up.append(down[i-1]+1)
                res = max(res, up.last!)
                down.append(1)
            } else if n > arr[i-1] {
                down.append(up[i-1]+1)
                res = max(res, down.last!)
                up.append(1)
            } else {
                up.append(1)
                down.append(1)
            }
        }
        return res
    }
    
//O(n), O(1)
    func maxTurbulenceSize(_ arr: [Int]) -> Int {
        var up = 1
        var down = 1
        var res = 1
        for i in 1..<arr.endIndex {
            let n = arr[i]
            if n < arr[i-1] {
                up = down+1
                res = max(res, up)
                down = 1
            } else if n > arr[i-1] {
                down = up+1
                res = max(res, down)
                up = 1
            } else {
                up = 1
                down = 1
            }
        }
        return res
    }