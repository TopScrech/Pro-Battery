import Foundation

func fetchDesignCycles() -> Int {
    if let props = fetchBatteryProps(), let cycleCount = props["DesignCycleCount9C"] as? Int {
        cycleCount
    } else {
        -1
    }
}

func fetchDesignCycles(_ props: NSDictionary) -> Int {
    if let cycleCount = props["DesignCycleCount9C"] as? Int {
        cycleCount
    } else {
        -1
    }
}
