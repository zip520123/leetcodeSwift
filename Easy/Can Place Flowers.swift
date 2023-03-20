//Can Place Flowers
//O(n),O(n)
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var arr = flowerbed, n = n
        for i in 0..<arr.endIndex {
            if arr[i] == 0 {
                if i == 0 && i+1 < arr.endIndex && arr[i+1] == 0 || 
                i-1 >= 0 && arr[i-1] == 0 && i+1 < arr.endIndex && arr[i+1] == 0 ||
                i-1 >= 0 && arr[i-1] == 0 && i == arr.endIndex-1 ||
                i == 0 && i == arr.endIndex-1
                {
                    arr[i] = 1
                    n -= 1
                } 
            }
        }
        return n <= 0
    }

    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var arr = flowerbed, n = n
        for i in 0..<arr.endIndex {
            if arr[i] == 0 {
                if (i == 0 || (i-1 >= 0 && arr[i-1] == 0)) && 
                (i == arr.endIndex-1 || (i+1 < arr.endIndex && arr[i+1] == 0)) {
                    n -= 1
                    arr[i] = 1
                }
            }
        }
        return n <= 0
    }

    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {

        var flowerbed = flowerbed
        var count = 0
        for i in 0..<flowerbed.endIndex {
            if flowerbed[i] == 0 {
                if i == 0 {
                    if i+1 < flowerbed.endIndex && flowerbed[i+1] == 0 {
                        flowerbed[i] = 1
                        count += 1
                    } else if i+1 == flowerbed.endIndex {
                        flowerbed[i] = 1
                        count += 1
                    }
                } else if i == flowerbed.endIndex-1 {
                    if i-1 >= 0 && flowerbed[i-1] == 0 {
                        flowerbed[i] = 1
                        count += 1
                    }
                } else {
                    if i-1 >= 0 && flowerbed[i-1] == 0 && i+1 < flowerbed.endIndex && flowerbed[i+1] == 0 {
                        flowerbed[i] = 1
                        count += 1
                    } 
                }
            } 
        }
        return count >= n
    }