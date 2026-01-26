import Foundation
import DeviceKit
import OSLog

@Observable
final class BatteryVM {
    private let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "ProBattery", category: "BatteryVM")
    // Charge Information
    var isBelowWarningLevel = false
    var isFullyCharged = false
    var isCharging = false
    var stateOfCharge = 0
    
    // Health Information
    var cycleCount = 0
    var designCycleCount = 0
    var condition = ""
    var maximumCapacity = 0
    var timeRemaining = 0
    var amperage = 0
    
    var temperature = 0.0
    var isLowPowerMode = false
    //    var isHighPowerMode = false
    
    init() {
        fetchBatteryInfo()
    }
    
    func fetchBatteryInfo() {
        DispatchQueue.global(qos: .background).async {
            // Create a matching dictionary to find the battery service
            guard let matchingDict = IOServiceMatching("AppleSmartBattery") else {
                self.logger.error("Failed to create matching dictionary")
                return
            }
            
            // Get the battery service
            let serviceObject = IOServiceGetMatchingService(kIOMainPortDefault, matchingDict)
            
            if serviceObject == 0 {
                self.logger.warning("Battery service not found")
                return
            }
            
            // Retrieve the properties of the battery
            var properties: Unmanaged<CFMutableDictionary>?
            
            let result = IORegistryEntryCreateCFProperties(serviceObject, &properties, kCFAllocatorDefault, 0)
            IOObjectRelease(serviceObject)
            
            if result != KERN_SUCCESS {
                self.logger.error("Failed to retrieve battery properties")
                return
            }
            
            // Extract the properties
            guard let props = properties?.takeRetainedValue() as NSDictionary? else {
                self.logger.error("Battery properties could not be read")
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
                
                if let temp = props["Temperature"] as? Int {
                    self.temperature = Double(temp) / 100
                }
                
                if let designCycleCount = props["DesignCycleCount9C"] as? Int {
                    self.designCycleCount = designCycleCount
                }
                
                if let timeRemaining = props["TimeRemaining"] as? Int {
                    self.timeRemaining = timeRemaining
                }
                
                if let amperage = props["Amperage"] as? Int {
                    self.amperage = amperage / 100
                }
                
                if let temp = props["Temperature"] as? Int {
                    self.temperature = Double(temp) / 100
                }
                
                self.cycleCount      = fetchCyclesCount(props)
                self.condition       = fetchCondition(props)
                self.maximumCapacity = fetchMaxCapacity(props)
                
                // Power Modes
                self.isLowPowerMode = ProcessInfo.processInfo.isLowPowerModeEnabled
            }
        }
    }
}
