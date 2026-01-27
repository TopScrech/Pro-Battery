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
    var isHighPowerMode = false
    
    init() {
        fetchBatteryInfo()
    }
    
    func fetchBatteryInfo() {
        Task {
            guard let props = fetchBatteryProps(logger: logger) else {
                return
            }
            
            // Charge Information
            isBelowWarningLevel = (props["AtCriticalLevel"] as? Int) == 1
            
            isFullyCharged = (props["FullyCharged"] as? Int) == 1
            
            isCharging = (props["IsCharging"] as? Int) == 1
            
            if let currentCapacity = props["CurrentCapacity"] as? Int,
               let maxCapacity = props["MaxCapacity"] as? Int {
                let state = Int(Double(currentCapacity) / Double(maxCapacity) * 100)
                stateOfCharge = state
            }
            
            if let temp = props["Temperature"] as? Int {
                temperature = Double(temp) / 100
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
            
            cycleCount      = fetchCyclesCount(props)
            condition       = fetchCondition(props)
            maximumCapacity = fetchMaxCapacity(props)
            
            // Power Modes
            isLowPowerMode = ProcessInfo.processInfo.isLowPowerModeEnabled
            isHighPowerMode = fetchPowerMode() == 2
        }
    }
}

private func fetchBatteryProps(logger: Logger) -> NSDictionary? {
    guard let matchingDict = IOServiceMatching("AppleSmartBattery") else {
        logger.error("Failed to create matching dictionary")
        return nil
    }
    
    let serviceObject = IOServiceGetMatchingService(kIOMainPortDefault, matchingDict)
    
    if serviceObject == 0 {
        logger.warning("Battery service not found")
        return nil
    }
    
    var properties: Unmanaged<CFMutableDictionary>?
    
    let result = IORegistryEntryCreateCFProperties(serviceObject, &properties, kCFAllocatorDefault, 0)
    IOObjectRelease(serviceObject)
    
    if result != KERN_SUCCESS {
        logger.error("Failed to retrieve battery properties")
        return nil
    }
    
    guard let props = properties?.takeRetainedValue() as NSDictionary? else {
        logger.error("Battery properties could not be read")
        return nil
    }
    
    return props
}

private func fetchPowerMode() -> Int? {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/usr/bin/pmset")
    process.arguments = ["-g"]
    
    let outputPipe = Pipe()
    process.standardOutput = outputPipe
    process.standardError = Pipe()
    
    do {
        try process.run()
    } catch {
        return nil
    }
    
    process.waitUntilExit()
    
    guard process.terminationStatus == 0 else {
        return nil
    }
    
    let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(decoding: outputData, as: UTF8.self)
    
    for line in output.split(whereSeparator: \.isNewline) {
        let trimmed = line.trimmingCharacters(in: .whitespaces)
        guard trimmed.hasPrefix("powermode") else {
            continue
        }
        
        let parts = trimmed.split(whereSeparator: \.isWhitespace)
        guard let value = parts.last, let intValue = Int(value) else {
            return nil
        }
        
        return intValue
    }
    
    return nil
}
