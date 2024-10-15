import Foundation

func fetchDesignCycles() -> Int {
    guard
        let props = fetchBatteryProps(),
        let cycleCount = props["DesignCycleCount9C"] as? Int
    else {
        return -1
    }
    
    return cycleCount
}

func fetchDesignCycles(_ props: NSDictionary) -> Int {
    guard
        let cycleCount = props["DesignCycleCount9C"] as? Int
    else {
        return -1
    }
    
    return cycleCount
}
