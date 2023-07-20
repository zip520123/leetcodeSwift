// Asteroid Collision
//O(n), O(n)
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack = [Int]()
        for n in asteroids {
            if stack.isEmpty {
                stack.append(n)
            } else {
                if n > 0 {
                    stack.append(n)
                } else {
                    while !stack.isEmpty && stack.last! > 0 && stack.last! < -n {
                        stack.removeLast()
                    }

                    if !stack.isEmpty {
                        if stack.last! == -n {
                            stack.removeLast()
                        } else if stack.last! < 0 {
                            stack.append(n)
                        }
                    } else {
                        stack.append(n)
                    }
                }
            }
        }
        return stack
    }