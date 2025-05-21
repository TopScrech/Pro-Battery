import SwiftUI

struct CapacitySmallView: View {
    private let entry: CapacityProvider.Entry
    
    init(_ entry: CapacityProvider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        VStack {
            Text("\(entry.capacity)%")
                .fontSize(250)
                .minimumScaleFactor(0.01)
            
            if entry.configuration.showTitle {
                Text("Max. capacity")
                    .secondary()
            }
        }
        .rounded()
    }
}

//#Preview {
//    CyclesSmallView()
//}
