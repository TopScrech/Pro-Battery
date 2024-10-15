import Foundation

func fetchCycleCount() -> Int {
    guard
        let props = fetchBatteryProps(),
        let cycleCount = props["CycleCount"] as? Int
    else {
        return -1
    }
    
    return cycleCount
}

func fetchCyclesCount(_ props: NSDictionary) -> Int {
    guard
        let cycleCount = props["CycleCount"] as? Int
    else {
        return -1
    }
    
    return cycleCount
}
