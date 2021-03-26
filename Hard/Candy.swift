/*Candy*/
//brute force time O(n^2) space O(n) TLE
func candy(_ ratings: [Int]) -> Int {
    var arr = [Int](repeating: 1, count: ratings.endIndex)
    var needChange = true
    while needChange {
        needChange = false
        var i = 0
        while i < ratings.endIndex {
            if i == 0 && i+1 < ratings.endIndex && arr[i] <= arr[i+1] && ratings[i] > ratings[i+1] {
                
                arr[i] += 1
                needChange = true
                
            }else if i > 0 && i < ratings.endIndex - 1 && i-1>=0 && i+1 < ratings.endIndex { 
                if ratings[i] > ratings[i+1] && arr[i] <= arr[i+1] || 
                ratings[i] > ratings[i-1] && arr[i] <= arr[i-1] {
                    arr[i] += 1
                    needChange = true
                }
            }else if i-1 >= 0 {
                if ratings[i] > ratings[i-1] && arr[i] <= arr[i-1] {
                    arr[i] += 1
                    needChange = true
                }
            }
            
            i += 1
        }
    }
    var sum = 0
    for n in arr {
        sum += n
    }
    return sum
}

//two arr time O(n) space O(n)
func candy(_ ratings: [Int]) -> Int {
    var left2right = [Int](repeating:0,count: ratings.endIndex)
    var right2left = [Int](repeating:0,count: ratings.endIndex)
    left2right[0] = 1
    
    for i in 1..<ratings.endIndex {
        if ratings[i-1] < ratings[i] {
            left2right[i] = left2right[i-1] + 1
        } else {
            left2right[i] = 1
        }
    }
    right2left[ratings.endIndex - 1] = 1
    for i in (0..<ratings.endIndex - 1).reversed() {
        if ratings[i] > ratings[i+1] {
            right2left[i] = right2left[i+1] + 1
        } else {
            right2left[i] = 1
        }
    }
    return zip(left2right,right2left).map { max($0,$1) }.reduce(0,+)
}

//one arr time O(n) space O(n)
func candy(_ ratings: [Int]) -> Int {
    if ratings.endIndex == 0 {return 0}
    var arr = [1]
    for i in 1..<ratings.endIndex {
        if ratings[i-1] < ratings[i] {
            arr.append(arr[i-1]+1)
        } else {
            arr.append(1)
        }
    }
    
    for i in (0..<ratings.endIndex - 1).reversed() {
        if ratings[i+1] < ratings[i] {
            arr[i] = max(arr[i+1]+1,arr[i])
        } 
    }
    return arr.reduce(0,+)
}