import Foundation

func fetchCapacity() -> Int {
    guard
        let props = fetchBatteryInfo(),
        let maxCapacity = props["MaxCapacity"] as? Int
    else {
        return -1
    }
    
    return maxCapacity
}

func fetchCapacity(_ props: NSDictionary) -> Int {
    guard
        let maxCapacity = props["MaxCapacity"] as? Int
    else {
        return -1
    }
    
    return maxCapacity
}
