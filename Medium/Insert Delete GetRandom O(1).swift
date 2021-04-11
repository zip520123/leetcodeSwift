// Insert Delete GetRandom O(1)

class RandomizedSet {

    var set = Set<Int>()
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        if set.contains(val) == false {
            set.insert(val)
            return true
        } else {
            return false
        }
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if set.contains(val) {
            set.remove(val)
            return true
        } else {
            return false
        }
    }
    
    /** Get a random element from the set. */
    func getRandom() -> Int {
        return set.randomElement()!
    }
}