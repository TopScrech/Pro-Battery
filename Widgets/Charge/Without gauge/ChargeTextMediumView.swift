import SwiftUI

struct ChargeTextMediumView: View {
    @Environment(\.widgetFamily) private var family
    
    private let entry: ChargeTextProvider.Entry
    
    init(_ entry: ChargeTextProvider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        VStack {
            let charge = String(format: "%.0f", entry.charge)
            
            Text("\(charge)%")
                .fontSize(300)
                .minimumScaleFactor(0.01)
            
            if entry.configuration.showTitle {
                Text("Battery level")
                    .secondary()
                    .font(family == .systemExtraLarge ? .title : .body)
            }
        }
        .rounded()
    }
}

//#Preview {
//    ChargeTextMediumView()
//    .darkSchemePreferred()
//}
