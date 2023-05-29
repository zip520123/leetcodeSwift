// Design Parking System
class ParkingSystem {
    var big: Int
    var medium: Int
    var small: Int
    init(_ big: Int, _ medium: Int, _ small: Int) {
        self.big = big
        self.medium = medium
        self.small = small
    }
    
    func addCar(_ carType: Int) -> Bool {
        switch carType {
            case 1:
                if big > 0 {
                    big -= 1
                    return true
                }
            case 2:
                if medium > 0 {
                    medium -= 1
                    return true
                }
            case 3:
                if small > 0 {
                    small -= 1
                    return true
                }
            default:
                break
        }
        return false
    }
}