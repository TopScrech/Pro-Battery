import Foundation

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

func fetchCycles() -> Int? {
    guard let props = fetchBatteryInfo() else {
        return nil
    }
    
    //        DispatchQueue.main.async {
    //            // Charge Information
    //            self.isBelowWarningLevel = (props["AtCriticalLevel"] as? Int) == 1
    //            self.isFullyCharged = (props["FullyCharged"] as? Int) == 1
    //            self.isCharging = (props["IsCharging"] as? Int) == 1
    //
    //            if let currentCapacity = props["CurrentCapacity"] as? Int,
    //               let maxCapacity = props["MaxCapacity"] as? Int {
    //                let state = Int(Double(currentCapacity) / Double(maxCapacity) * 100)
    //                self.stateOfCharge = state
    //            }
    
    if let cycleCount = props["CycleCount"] as? Int {
        return cycleCount
    } else {
        return -1
    }
    
    //            if let permanentFailureStatus = props["PermanentFailureStatus"] as? Int, permanentFailureStatus == 0 {
    //                self.condition = "Normal"
    //            } else {
    //                self.condition = "Service Battery"
    //            }
    //
    //            if let maxCapacity = props["MaxCapacity"] as? Int {
    //                self.maximumCapacity = maxCapacity
    //            }
    //
    //            // Power Modes
    //            self.isLowPowerMode = ProcessInfo.processInfo.isLowPowerModeEnabled
    //
    //            self.isHighPowerMode = false
    //        }
}

//func fetchCycles() -> BatteryInfo? {
//    guard let props = fetchBatteryInfo() else {
//        return nil
//    }
//
//    var info = BatteryInfo(
//        cycles: -1
//    )
//
//    //        DispatchQueue.main.async {
//    //            // Charge Information
//    //            self.isBelowWarningLevel = (props["AtCriticalLevel"] as? Int) == 1
//    //            self.isFullyCharged = (props["FullyCharged"] as? Int) == 1
//    //            self.isCharging = (props["IsCharging"] as? Int) == 1
//    //
//    //            if let currentCapacity = props["CurrentCapacity"] as? Int,
//    //               let maxCapacity = props["MaxCapacity"] as? Int {
//    //                let state = Int(Double(currentCapacity) / Double(maxCapacity) * 100)
//    //                self.stateOfCharge = state
//    //            }
//
//    if let cycleCount = props["CycleCount"] as? Int {
//        info.cycles = cycleCount
//    }
//
//    //            if let permanentFailureStatus = props["PermanentFailureStatus"] as? Int, permanentFailureStatus == 0 {
//    //                self.condition = "Normal"
//    //            } else {
//    //                self.condition = "Service Battery"
//    //            }
//    //
//    //            if let maxCapacity = props["MaxCapacity"] as? Int {
//    //                self.maximumCapacity = maxCapacity
//    //            }
//    //
//    //            // Power Modes
//    //            self.isLowPowerMode = ProcessInfo.processInfo.isLowPowerModeEnabled
//    //
//    //            self.isHighPowerMode = false
//    //        }
//
//    return info
//}
