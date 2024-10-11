import SwiftUI

struct CyclesSmallWidgetView: View {
    private var entry: CyclesProvider.Entry
    
    init(_ entry: CyclesProvider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        VStack {
            Text("100")
                .fontSize(250)
                .minimumScaleFactor(0.001)
            
            if entry.configuration.showTitle {
                Text("Charge cycles")
                    .secondary()
            }
        }
        .rounded()
    }
}

//#Preview {
//    CyclesSmallWidgetView()
//}
