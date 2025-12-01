import SwiftUI

struct ChargeTextSmallView: View {
    @Environment(\.widgetFamily) private var family
    
    private let entry: ChargeTextProvider.Entry
    
    init(_ entry: ChargeTextProvider.Entry) {
        self.entry = entry
    }
    
    private var charge: String {
        String(format: "%.0f", entry.charge)
    }
    
    var body: some View {
        VStack {
            Text("\(charge)%")
                .fontSize(250)
                .minimumScaleFactor(0.01)
            
            if entry.configuration.showTitle {
                Text("Battery level")
                    .secondary()
                    .font(family == .systemLarge ? .title2 : .body)
            }
        }
        .rounded()
    }
}

//#Preview {
//    CyclesSmallView()
//    .darkSchemePreferred()
//}
