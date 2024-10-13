import SwiftUI

struct ChargeWidgetInfo {
    let charge: Double
    let cycles: Int
    let capacity: Int
    let condition: String
}

func fetchChargeWidgetInfo() -> ChargeWidgetInfo {
    guard let props = fetchBatteryInfo() else {
        return ChargeWidgetInfo(
            charge: -1,
            cycles: -1,
            capacity: -1,
            condition: "Unknown"
        )
    }
    
    let charge = fetchBatteryLevel()
    let cycles = fetchCycles(props)
    let capacity = fetchCapacity(props)
    let condition = fetchCondition(props)
    
    return ChargeWidgetInfo(
        charge: charge,
        cycles: cycles,
        capacity: capacity,
        condition: condition
    )
}

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
