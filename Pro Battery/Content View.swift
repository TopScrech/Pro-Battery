import ScrechKit
import WidgetKit

struct ContentView: View {
    @State private var vm = BatteryVM()
    
    var body: some View {
        List {
            Section {
                ListParam("Condition", param: vm.condition)
                ListParam("Cycle Count", param: vm.cycleCount.description)
                ListParam("Design cycle count", param: vm.designCycleCount.description)
                ListParam("Maximum Capacity", param: vm.maximumCapacity.description)
                ListParam("Low Power Mode", param: vm.isLowPowerMode ? "Yes" : "No")
                ListParam("Battery Level", param: vm.stateOfCharge.description)
                ListParam("Temperature", param: "\(vm.temperature) °C")
            }
#if DEBUG
            let chargingOrDischarging: LocalizedStringKey = vm.amperage >= 0 ? "Charging with" : "Discharging with"
            ListParam(chargingOrDischarging, param: "\(vm.amperage) Watts")
            
            ListParam("Time Remaining", param: vm.timeRemaining.description)
            
            ListParam("Charging", param: vm.isCharging ? "Yes" : "No")
            
#warning("Have to be checked")
            ListParam("Below warning level", param: vm.isBelowWarningLevel ? "Yes" : "No")
            ListParam("Fully charged", param: vm.isFullyCharged ? "Yes" : "No")
            //            ListParam("High Power Mode", param: vm.isHighPowerMode ? "Yes" : "No")
#endif
            Section {
                HStack {
                    Button("Refresh") {
                        vm.fetchBatteryInfo()
                        WidgetCenter.shared.reloadAllTimelines()
                    }
                    
                    Button("Quit") {
                        exit(0)
                    }
                }
            }
        }
        .frame(width: 200)
    }
}

#Preview {
    ContentView()
}
