import SwiftUI

struct ChargeMediumView: View {
    private var entry: ChargeProvider.Entry
    
    init(_ entry: ChargeProvider.Entry) {
        self.entry = entry
    }
    
    private var showVersion: Bool {
        entry.configuration.showBuildNumber
    }
    
    private var isCapacity: Bool {
        entry.configuration.capacityGauge
    }
    
    var body: some View {
        HStack {
            BatteryGauge(entry.charge, isCapacity: isCapacity)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 5) {
                Param("Max. capacity", param: "16")
                
                Param("Charge cycles", param: "16")
                
                Param("Condition", param: "Normal")
            }
            .frame(maxWidth: 170)
        }
        .padding(.leading, 35)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .topTrailing) {
            if showVersion {
                Text(version())
                    .caption2()
                    .foregroundStyle(.tertiary)
                    .offset(x: 12, y: -8)
            }
        }
    }
}

//#Preview {
//    ChargeMediumView()
//}
