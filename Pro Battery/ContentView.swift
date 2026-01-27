import ScrechKit
import WidgetKit

struct ContentView: View {
    @State private var vm = BatteryVM()
    
    var body: some View {
        List {
            Section {
                LabeledContent("Condition", value: vm.condition)
                LabeledContent("Cycle Count", value: vm.cycleCount.description)
                LabeledContent("Design cycle count", value: vm.designCycleCount.description)
                LabeledContent("Maximum Capacity", value: vm.maximumCapacity.description)
                LabeledContent("Low Power Mode", value: vm.isLowPowerMode ? "Yes" : "No")
                LabeledContent("Battery Level", value: vm.stateOfCharge.description)
                LabeledContent("Temperature", value: "\(vm.temperature) °C")
            }
            
            let chargingOrDischarging: LocalizedStringKey = vm.amperage >= 0 ? "Charging with" : "Discharging with"
            
            LabeledContent(chargingOrDischarging, value: "\(vm.amperage) Watts")
            LabeledContent("Time Remaining", value: vm.timeRemaining.description)
            LabeledContent("Charging", value: vm.isCharging ? "Yes" : "No")
            LabeledContent("Below warning level", value: vm.isBelowWarningLevel ? "Yes" : "No")
            LabeledContent("Fully charged", value: vm.isFullyCharged ? "Yes" : "No")
            
            // LabeledContent("High Power Mode", value: vm.isHighPowerMode ? "Yes" : "No")
            
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
        .frame(width: 300)
        .frame(maxHeight: 400)
    }
}

#Preview {
    ContentView()
        .darkSchemePreferred()
}
