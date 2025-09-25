import SwiftUI

struct ChargeMediumView: View {
    @Environment(\.widgetFamily) private var widgetFamily
    
    private let entry: ChargeProvider.Entry
    
    init(_ entry: ChargeProvider.Entry) {
        self.entry = entry
    }
    
    private var showVersion: Bool {
        entry.configuration.showBuildNumber
    }
    
    private var isCapacity: Bool {
        entry.configuration.capacityGauge
    }
    
    private var isExtraLarge: Bool {
        widgetFamily == .systemExtraLarge
    }
    
    var body: some View {
        HStack {
            BatteryGauge(entry.charge, isCapacity: isCapacity)
            
            if isExtraLarge {
                Spacer()
                    .frame(maxWidth: 50)
            } else {
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Param("Max. capacity", param: "\(entry.capacity)%")
                
                Param("Charge cycles", param: entry.cycles)
                
                Param("Condition", param: entry.condition)
                
                let temp = String(format: "%.1f °C", entry.temperature)
                Param("Temperature", param: temp)
            }
            .frame(maxWidth: 170)
        }
        .padding(.leading, 35)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .scaleEffect(isExtraLarge ? 2 : 1)
        .overlay(alignment: .topTrailing) {
            if showVersion {
                Text(version())
                    .tertiary()
                    .font(isExtraLarge ? .title3 : .caption2)
                    .offset(x: 4, y: -8)
            }
        }
    }
}

//#Preview {
//    ChargeMediumView()
//    .darkSchemePreferred()
//}
