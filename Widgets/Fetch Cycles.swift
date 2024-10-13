import Foundation

func fetchCycles() -> Int {
    guard
        let props = fetchBatteryInfo(),
        let cycleCount = props["CycleCount"] as? Int
    else {
        return -1
    }
    
    return cycleCount
}

func fetchCycles(_ props: NSDictionary) -> Int {
    guard
        let cycleCount = props["CycleCount"] as? Int
    else {
        return -1
    }
    
    return cycleCount
}
