import Foundation

func fetchBatteryProps() -> NSDictionary? {
    // Find the battery service
    guard let matchingDict = IOServiceMatching("AppleSmartBattery") else {
        print("Failed to create matching dictionary")
        return nil
    }
    
    let serviceObject = IOServiceGetMatchingService(kIOMainPortDefault, matchingDict)
    
    if serviceObject == 0 {
        print("Battery service not found")
        return nil
    }
    
    // Battery properties
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
