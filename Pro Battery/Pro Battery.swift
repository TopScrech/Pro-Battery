import ScrechKit
import IOKit.ps

@main
struct ProBattery: App {
    private var icon: String {
        if charge() < 0 || charge() > 100 {
            "exclamationmark.triangle"
        } else if charge() >= 95 {
            "battery.100"
        } else if charge() >= 75 {
            "battery.75"
        } else if charge() >= 50 {
            "battery.50"
        } else if charge() >= 25 {
            "battery.25"
        } else {
            "battery.0"
        }
    }
    
    var body: some Scene {
        MenuBarExtra("Pro Battery", systemImage: icon) {
            NavContainer()
                .frame(width: 400)
                .frame(minHeight: 250, maxHeight: 300)
        }
        .menuBarExtraStyle(.window)
    }
    
    private func charge() -> Double {
        var percent = -1.0
        
        guard
            let snapshot = IOPSCopyPowerSourcesInfo()?.takeRetainedValue(),
            let sources = IOPSCopyPowerSourcesList(snapshot)?.takeRetainedValue() as? [CFTypeRef],
            !sources.isEmpty
        else {
            // No battery found (e.g., on a desktop Mac)
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
}
