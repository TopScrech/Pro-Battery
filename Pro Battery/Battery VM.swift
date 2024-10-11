import Foundation
import DeviceKit

@Observable
final class BatteryVM: ObservableObject {
    // Charge Information
    var isBelowWarningLevel = false
    var isFullyCharged = false
    var isCharging = false
    var stateOfCharge = 0
    
    // Health Information
    var cycleCount = 0
    var condition = ""
    var maximumCapacity = 0
    
    // Power Modes
    var isHighPowerMode = false
    var isLowPowerMode = false
    
    init() {
        fetchBatteryInfo()
    }
    
    func fetchBatteryInfo() {
        DispatchQueue.global(qos: .background).async {
            // Create a matching dictionary to find the battery service
            guard let matchingDict = IOServiceMatching("AppleSmartBattery") else {
                print("Failed to create matching dictionary")
                return
            }
            
            // Get the battery service
            let serviceObject = IOServiceGetMatchingService(kIOMainPortDefault, matchingDict)
            
            if serviceObject == 0 {
                print("Battery service not found")
                return
            }
            
            // Retrieve the properties of the battery
            var properties: Unmanaged<CFMutableDictionary>?
            
            let result = IORegistryEntryCreateCFProperties(serviceObject, &properties, kCFAllocatorDefault, 0)
            IOObjectRelease(serviceObject)
            
            if result != KERN_SUCCESS {
                print("Failed to retrieve battery properties")
                return
            }
            
            // Extract the properties
            guard let props = properties?.takeRetainedValue() as NSDictionary? else {
                print("Battery properties could not be read")
                return
            }
            
            DispatchQueue.main.async {
                // Charge Information
                self.isBelowWarningLevel = (props["AtCriticalLevel"] as? Int) == 1
                self.isFullyCharged = (props["FullyCharged"] as? Int) == 1
                self.isCharging = (props["IsCharging"] as? Int) == 1
                
                if let currentCapacity = props["CurrentCapacity"] as? Int,
                   let maxCapacity = props["MaxCapacity"] as? Int {
                    let state = Int(Double(currentCapacity) / Double(maxCapacity) * 100)
                    self.stateOfCharge = state
                }
                
                // Health Information
                if let cycleCount = props["CycleCount"] as? Int {
                    self.cycleCount = cycleCount
                }
                
                if let permanentFailureStatus = props["PermanentFailureStatus"] as? Int, permanentFailureStatus == 0 {
                    self.condition = "Normal"
                } else {
                    self.condition = "Service Battery"
                }
                
                if let maxCapacity = props["MaxCapacity"] as? Int {
                    self.maximumCapacity = maxCapacity
                }
                
                // Power Modes
                self.isLowPowerMode = ProcessInfo.processInfo.isLowPowerModeEnabled
                
                self.isHighPowerMode = false
            }
        }
    }
    
    func fetchPowerModeSettings() {
        // Access the IOPMrootDomain
        let rootDomain = IORegistryEntryFromPath(kIOMainPortDefault, "IOService:/IOResources/IOPMrootDomain")
        
        if rootDomain != 0 {
            // Retrieve the PerformanceMode property
            if let performanceModeCF = IORegistryEntryCreateCFProperty(rootDomain, "PerformanceMode" as CFString, kCFAllocatorDefault, 0)?.takeRetainedValue(),
               let performanceMode = performanceModeCF as? Int {
                DispatchQueue.main.async {
                    self.isHighPowerMode = performanceMode == 1
                }
            } else {
                print("PerformanceMode key not found")
            }
            IOObjectRelease(rootDomain)
        } else {
            print("Failed to access IOPMrootDomain")
        }
    }
}
