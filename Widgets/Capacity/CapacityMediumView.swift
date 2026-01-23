import SwiftUI

struct CapacityMediumView: View {
    @Environment(\.widgetFamily) private var family
    
    private let entry: CapacityProvider.Entry
    
    init(_ entry: CapacityProvider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        VStack {
            Text("\(entry.capacity)%")
                .fontSize(300)
                .minimumScaleFactor(0.01)
            
            if entry.configuration.showTitle {
                Text("Max. capacity")
                    .secondary()
                    .font(family == .systemExtraLarge ? .title : .body)
            }
        }
        .rounded()
    }
}

//#Preview {
//    CapacityMediumView()
//    .darkSchemePreferred()
//}
