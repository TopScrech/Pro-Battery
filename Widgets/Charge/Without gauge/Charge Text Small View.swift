import SwiftUI

struct ChargeTextSmallView: View {
    private var entry: ChargeTextProvider.Entry
    
    init(_ entry: ChargeTextProvider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        VStack {
            Text(entry.charge)
                .fontSize(250)
                .minimumScaleFactor(0.01)
            
            if entry.configuration.showTitle {
                Text("Battery level")
                    .secondary()
            }
        }
        .rounded()
    }
}

//#Preview {
//    CyclesSmallView()
//}
