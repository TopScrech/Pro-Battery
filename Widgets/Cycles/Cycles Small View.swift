import SwiftUI

struct CyclesSmallView: View {
    private var entry: CyclesProvider.Entry
    
    init(_ entry: CyclesProvider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        VStack {
            Text("0")
                .fontSize(250)
                .minimumScaleFactor(0.01)
            
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
