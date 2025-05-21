import SwiftUI

struct ChargeSmallView: View {
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
        VStack {
            BatteryGauge(entry.charge, isCapacity: isCapacity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .topTrailing) {
            if showVersion {
                Text(version())
                    .caption2()
                    .tertiary()
                    .offset(x: 12, y: -8)
            }
        }
    }
}

//#Preview {
//    ChargeSmallView()
//}
