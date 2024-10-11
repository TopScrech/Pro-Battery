import SwiftUI

struct CapacityEntryView: View {
    @Environment(\.widgetFamily) private var family
    
    private var entry: CapacityProvider.Entry
    
    init(_ entry: CapacityProvider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        switch family {
        case .systemSmall:
            CapacitySmallView(entry)
            
//        case .systemMedium:
            
            
        default:
            EmptyView()
        }
    }
}
