import SwiftUI

struct SmallCycleWidgetView: View {
    private var entry: CyclesProvider.Entry
    
    init(_ entry: CyclesProvider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        VStack {
            Text("1")
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
//    SmallCycleWidgetView()
//}
