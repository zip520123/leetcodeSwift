//Maximum Number of Balloons
//O(n), O(n)
    func maxNumberOfBalloons(_ text: String) -> Int {
        var res = Int.max
        var dict = [Character: Int]()
        for char in text {
            dict[char, default:0] += 1
        }
        for (char, value) in ["n":1,"l":2,"a":1,"b":1,"o":2] {
            let currCount = dict[Character(char), default:0]
            res = min(res, currCount / value)
        }
        return res
    }

    	// O(n) time | O(1) space
    func maxNumberOfBalloons(_ text: String) -> Int {
        var b = 0, a = 0, l = 0, o = 0, n = 0

        for char in text {
            switch char {
            case "b": b += 1
            case "a": a += 1
            case "l": l += 1
            case "o": o += 1
            case "n": n += 1
            default: continue
            }
        }

        l /= 2; o /= 2 // we need 2 letters of each

        return min(b, a, l, o, n)
    }
    
//O(n), O(n)
    func maxNumberOfBalloons(_ text: String) -> Int {
        var dict = [Character: Int]()
        for char in text {
            dict[char, default: 0] += 1
        }
        var res = Int.max
        for char in "ban" {
            res = min(res, dict[char, default:0])
        }
        for char in "lo" {
            res = min(res, dict[char, default:0] / 2)
        }
        return res
    }