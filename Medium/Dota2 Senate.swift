//Dota2 Senate
//O(n^2), O(n)
    func predictPartyVictory(_ senate: String) -> String {
        var arr = Array(senate)
        var d = 0, r = 0
        for char in arr {
            if char == "D" {d += 1}
            if char == "R" {r += 1}
        }
        
        while !(d == 0 || r == 0) {
            var i = 0
            next: while i < arr.endIndex {
                let char = arr[i]
                if char == "R" {
                    var j = i + 1
                    while j < arr.endIndex {
                        if arr[j] == "D" {
                            arr.remove(at: j)
                            d -= 1
                            i += 1
                            continue next
                        }
                        j += 1
                    }
                    j = 0
                    while j < i {
                        if arr[j] == "D" {
                            arr.remove(at: j)
                            d -= 1
                            continue next
                        }
                        j += 1
                    }
                    
                } else {
                    var j = i + 1
                    while j < arr.endIndex {
                        if arr[j] == "R" {
                            arr.remove(at: j)
                            r -= 1
                            i += 1
                            continue next
                        }
                        j += 1
                    }
                    j = 0
                    while j < i {
                        if arr[j] == "R" {
                            arr.remove(at: j)
                            r -= 1
                            continue next
                        }
                        j += 1
                    }
                }
                i += 1
            }
        }

        if d > r {
            return "Dire"
        }
        return "Radiant"
    }