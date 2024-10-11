import SwiftUI

struct SmallWidgetView: View {
    private var entry: Provider.Entry
    
    init(_ entry: Provider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        VStack {
            BatteryGauge(50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .topTrailing) {
            if entry.configuration.showBuildNumber {
                Text(version())
                    .caption2()
                    .foregroundStyle(.tertiary)
                    .offset(x: 12, y: -8)
            }
        }
    }
}

//#Preview {
//    SmallWidgetView()
//}
