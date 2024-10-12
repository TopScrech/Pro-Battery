import SwiftUI

struct ChargeTextEntryView: View {
    @Environment(\.widgetFamily) private var family
    
    private var entry: ChargeTextProvider.Entry
    
    init(_ entry: ChargeTextProvider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        switch family {
        case .systemSmall:
            ChargeTextSmallView(entry)
            
        default:
            EmptyView()
        }
    }
}
