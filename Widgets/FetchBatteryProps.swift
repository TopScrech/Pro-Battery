import Foundation
import OSLog

private let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "ProBattery", category: "Battery")

func fetchBatteryProps() -> NSDictionary? {
    // Find the battery service
    guard let matchingDict = IOServiceMatching("AppleSmartBattery") else {
        logger.error("Failed to create matching dictionary")
        return nil
    }
    
    let serviceObject = IOServiceGetMatchingService(kIOMainPortDefault, matchingDict)
    
    if serviceObject == 0 {
        logger.warning("Battery service not found")
        return nil
    }
    
    // Battery properties
    var properties: Unmanaged<CFMutableDictionary>?
    
    let result = IORegistryEntryCreateCFProperties(serviceObject, &properties, kCFAllocatorDefault, 0)
    IOObjectRelease(serviceObject)
    
    if result != KERN_SUCCESS {
        logger.error("Failed to retrieve battery properties")
        return nil
    }
    
    // Extract the properties
    guard let props = properties?.takeRetainedValue() as NSDictionary? else {
        logger.error("Battery properties could not be read")
        return nil
    }
    
    return props
}
