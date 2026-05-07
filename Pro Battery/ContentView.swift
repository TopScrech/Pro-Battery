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
                LabeledContent("Low Power Mode", value: boolValue(vm.isLowPowerMode))
                LabeledContent("Battery Level", value: vm.stateOfCharge.description)
                LabeledContent("Temperature", value: localizedTemperature(vm.temperature))
            }
            
            let chargingOrDischarging: LocalizedStringKey = vm.amperage >= 0 ? "Charging with" : "Discharging with"
            
            LabeledContent(chargingOrDischarging, value: localizedPower(vm.amperage))
            LabeledContent("Time Remaining", value: vm.timeRemaining.description)
            LabeledContent("Charging", value: boolValue(vm.isCharging))
            LabeledContent("Below warning level", value: boolValue(vm.isBelowWarningLevel))
            LabeledContent("Fully charged", value: boolValue(vm.isFullyCharged))
            LabeledContent("High Power Mode", value: boolValue(vm.isHighPowerMode))
            
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
        .task {
            vm.fetchBatteryInfo()
        }
    }
}

#Preview {
    ContentView()
        .darkSchemePreferred()
}

private func boolValue(_ value: Bool) -> String {
    String(localized: value ? "Yes" : "No")
}

private func localizedPower(_ value: Int) -> String {
    "\(value.formatted()) W"
}

private func localizedTemperature(_ value: Double) -> String {
    "\(value.formatted(.number.precision(.fractionLength(1)))) °C"
}
