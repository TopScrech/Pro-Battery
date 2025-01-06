import SwiftUI

@main
struct ProBattery: App {
    private var icon: String {
        if fetchBatteryLevel() < 0 || fetchBatteryLevel() > 100 {
            "exclamationmark.triangle"
        } else if fetchBatteryLevel() >= 95 {
            "battery.100"
        } else if fetchBatteryLevel() >= 75 {
            "battery.75"
        } else if fetchBatteryLevel() >= 50 {
            "battery.50"
        } else if fetchBatteryLevel() >= 25 {
            "battery.25"
        } else {
            "battery.0"
        }
    }
    
    var body: some Scene {
        MenuBarExtra("Pro Battery", systemImage: icon) {
            NavContainer()
                .frame(maxWidth: 400)
                .frame(minHeight: 100, maxHeight: 500)
        }
        .menuBarExtraStyle(.window)
        
        Settings {
            SettingsView()
        }
    }
}
