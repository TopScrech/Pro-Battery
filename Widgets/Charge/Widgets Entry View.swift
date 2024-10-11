import SwiftUI

struct WidgetsEntryView: View {
    @Environment(\.widgetFamily) private var family
    
    private var entry: ChargeProvider.Entry
    
    init(_ entry: ChargeProvider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        switch family {
        case .systemSmall:
            SmallChargeWidgetView(entry)
            
        case .systemMedium:
            MediumChargeWidgetView(entry)
            
        default:
            EmptyView()
        }
    }
}
