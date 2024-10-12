import SwiftUI

//struct BatteryInfo {
//    var cycles: Int
//}

func fetchBatteryInfo() -> NSDictionary? {
    // Create a matching dictionary to find the battery service
    guard let matchingDict = IOServiceMatching("AppleSmartBattery") else {
        print("Failed to create matching dictionary")
        return nil
    }
    
    // Get the battery service
    let serviceObject = IOServiceGetMatchingService(kIOMainPortDefault, matchingDict)
    
    if serviceObject == 0 {
        print("Battery service not found")
        return nil
    }
    
    // Retrieve the properties of the battery
    var properties: Unmanaged<CFMutableDictionary>?
    
    let result = IORegistryEntryCreateCFProperties(serviceObject, &properties, kCFAllocatorDefault, 0)
    IOObjectRelease(serviceObject)
    
    if result != KERN_SUCCESS {
        print("Failed to retrieve battery properties")
        return nil
    }
    
    // Extract the properties
    guard let props = properties?.takeRetainedValue() as NSDictionary? else {
        print("Battery properties could not be read")
        return nil
    }
    
    return props
}

func fetchCycles() -> Int {
    guard
        let props = fetchBatteryInfo(),
        let cycleCount = props["CycleCount"] as? Int
    else {
        return -1
    }
    
    return cycleCount
}

func fetchCondition() -> String {
    guard let props = fetchBatteryInfo() else {
        return "Unknown"
    }
    
    if let permanentFailureStatus = props["PermanentFailureStatus"] as? Int, permanentFailureStatus == 0 {
        return "Normal"
    } else {
        return "Service recommended"
    }
}

func fetchCapacity() -> Int {
    guard
        let props = fetchBatteryInfo(),
        let maxCapacity = props["MaxCapacity"] as? Int
    else {
        return -1
    }
    
    return maxCapacity
}
