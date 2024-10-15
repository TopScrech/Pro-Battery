import SwiftUI

struct CyclesSmallView: View {
    private var entry: CyclesProvider.Entry
    
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
                    .foregroundStyle(.tertiary)
                    .fontSize(30)
                    .minimumScaleFactor(0.01)
                    .offset(y: -10)
            }
            
            if entry.configuration.showTitle {
                Text("Charge cycles")
                    .secondary()
            }
        }
        .rounded()
    }
}

//#Preview {
//    CyclesSmallView()
//}
