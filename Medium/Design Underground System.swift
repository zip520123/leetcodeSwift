//Design Underground System

class UndergroundSystem {
    typealias ID = Int
    typealias Time = Int
    typealias Station = String
    typealias StartNameToEndName = String
    
    var checkIn = [ID: (Time, Station)]()
    var average = [StartNameToEndName: [Time]]() //O(startStation*endStation)
    
    func checkIn(_ id: Int, _ stationName: String, _ t: Int) { //O(1)
        checkIn[id] = (t, stationName)
    }
    
    func checkOut(_ id: Int, _ stationName: String, _ t: Int) { //O(1)
        let (checkInTime, checkInName) = checkIn[id]!
        average["\(checkInName)-\(stationName)", default: []].append(t-checkInTime)
    }
    
    func getAverageTime(_ startStation: String, _ endStation: String) -> Double {//O(startStation*endStation) * arr.len
        let arr = average["\(startStation)-\(endStation)", default: []]
        let sum = arr.reduce(0, +)
        let res = Double(sum) / Double(arr.count)
        return res
    }
}