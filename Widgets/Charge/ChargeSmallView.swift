import SwiftUI

struct ChargeSmallView: View {
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
    
    private var isLarge: Bool {
        widgetFamily == .systemLarge
    }
    
    var body: some View {
        VStack {
            BatteryGauge(entry.charge, isCapacity: isCapacity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .scaleEffect(isLarge ? 2 : 1)
        .overlay(alignment: .topTrailing) {
            if showVersion {
                Text(version())
                    .font(isLarge ? .title3 : .caption2)
                    .tertiary()
                    .offset(x: 4, y: -8)
            }
        }
    }
}

//#Preview {
//    ChargeSmallView()
//    .darkSchemePreferred()
//}
