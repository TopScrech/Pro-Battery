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
            ChargeSmallWidgetView(entry)
            
        case .systemMedium:
            ChargeMediumWidgetView(entry)
            
        default:
            EmptyView()
        }
    }
}
