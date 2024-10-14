import Foundation

func fetchCapacity() -> Int {
    guard
        let props = fetchBatteryInfo(),
        let designCapacity = props["DesignCapacity"] as? Double,
        let maxCapacity = props["AppleRawMaxCapacity"] as? Double
    else {
        return -1
    }
    
    let percentage = maxCapacity / designCapacity * 100
    return Int(percentage)
}

func fetchCapacity(_ props: NSDictionary) -> Int {
    guard
        let designCapacity = props["DesignCapacity"] as? Double,
        let maxCapacity = props["AppleRawMaxCapacity"] as? Double
    else {
        return -1
    }
    
    let percentage = maxCapacity / designCapacity * 100
    return Int(percentage)
}
