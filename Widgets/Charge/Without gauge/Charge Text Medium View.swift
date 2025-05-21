import SwiftUI

struct ChargeTextMediumView: View {
    @Environment(\.widgetFamily) private var widgetFamily
    
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
                .fontSize(300)
                .minimumScaleFactor(0.01)
            
            if entry.configuration.showTitle {
                Text("Battery level")
                    .secondary()
                    .font(widgetFamily == .systemExtraLarge ? .title : .body)
            }
        }
        .rounded()
    }
}

//#Preview {
//    ChargeTextMediumView()
//}
