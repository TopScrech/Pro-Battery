import SwiftUI

struct CyclesSmallView: View {
    @Environment(\.widgetFamily) private var widgetFamily
    
    private let entry: CyclesProvider.Entry
    
    init(_ entry: CyclesProvider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        VStack {
            Text(entry.cycles)
                .fontSize(250)
                .minimumScaleFactor(0.01)
            
            if entry.configuration.showDesignCycles {
                Text("/\(entry.designCycles)")
                    .tertiary()
                    .fontSize(30)
                    .minimumScaleFactor(0.01)
                    .offset(y: -10)
            }
            
            if entry.configuration.showTitle {
                Text("Charge cycles")
                    .secondary()
                    .font(widgetFamily == .systemLarge ? .title2 : .body)
            }
        }
        .rounded()
    }
}

//#Preview {
//    CyclesSmallView()
//    .darkSchemePreferred()
//}
