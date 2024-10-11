import ScrechKit
import IOKit.ps

@main
struct ProBattery: App {
    private var icon: String {
        switch getBatteryLevel() {
        case 0...25: "bolt.fill.slash.bolt.fill"
        case 26...50: "bolt.fill.bolt.fill"
        case 51...75: "bolt.fill"
        case 76...100: "bolt"
        default: "bolt.fill.slash.bolt.fill"
        }
    }
    
    var body: some Scene {
        MenuBarExtra("Pro Battery", systemImage: icon) {
            ContentView()
        }
    }
    
    func getBatteryLevel() -> Double {
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
