import SwiftUI

struct ChargeEntryView: View {
    @Environment(\.widgetFamily) private var family
    
    private var entry: ChargeProvider.Entry
    
    init(_ entry: ChargeProvider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        switch family {
        case .systemSmall:
            ChargeSmallView(entry)
            
        case .systemMedium:
            ChargeMediumView(entry)
            
        default:
            EmptyView()
        }
    }
}
