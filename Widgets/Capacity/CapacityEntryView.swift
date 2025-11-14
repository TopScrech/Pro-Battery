import SwiftUI

struct CapacityEntryView: View {
    @Environment(\.widgetFamily) private var family
    
    private let entry: CapacityProvider.Entry
    
    init(_ entry: CapacityProvider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        switch family {
        case .systemSmall, .systemLarge:
            CapacitySmallView(entry)
            
        case .systemMedium, .systemExtraLarge:
            CapacityMediumView(entry)
            
        default:
            EmptyView()
        }
    }
}
