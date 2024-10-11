import ScrechKit

struct ContentView: View {
    @State private var vm = BatteryVM()
    
    var body: some View {
        List {
            Section {
                Button("Test") {
                    vm.fetchPowerModeSettings()
                }
            }
            
            ListParam("Below warning level", param: vm.isBelowWarningLevel ? "Yes" : "No")
            ListParam("Fully charged", param: vm.isFullyCharged ? "Yes" : "No")
            ListParam("Charging", param: vm.isCharging ? "Yes" : "No")
            ListParam("Battery Level", param: vm.stateOfCharge.description)
            ListParam("Condition", param: vm.condition)
            ListParam("Cycle Count", param: vm.cycleCount.description)
            ListParam("Maximum Capacity", param: vm.maximumCapacity.description)
            ListParam("High Power Mode", param: vm.isHighPowerMode ? "Yes" : "No")
            ListParam("Low Power Mode", param: vm.isLowPowerMode ? "Yes" : "No")
        }
        .frame(width: 200)
        .refreshable {
            vm.fetchBatteryInfo()
        }
    }
}

#Preview {
    ContentView()
}
