import IOKit.ps

func fetchBatteryLevel() -> Double {
    var percent = -1.0
    
    guard
        let snapshot = IOPSCopyPowerSourcesInfo()?.takeRetainedValue(),
        let sources = IOPSCopyPowerSourcesList(snapshot)?.takeRetainedValue() as? [CFTypeRef],
        !sources.isEmpty
    else {
        // No battery found / desktop Mac
        return percent
    }
    
    for ps in sources {
        if let info = IOPSGetPowerSourceDescription(snapshot, ps)?.takeUnretainedValue() as? [String: Any],
           let capacity = info[kIOPSCurrentCapacityKey as String] as? Int,
           let max = info[kIOPSMaxCapacityKey as String] as? Int {
            percent = (Double(capacity) / Double(max)) * 100
            break
        }
    }
    
    return percent
}
