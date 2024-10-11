import SwiftUI

struct WidgetsEntryView: View {
    @Environment(\.widgetFamily) private var family
    
    private var entry: Provider.Entry
    
    init(_ entry: Provider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        switch family {
        case .systemSmall:
            SmallWidgetView(entry)
            
        case .systemMedium:
            MediumWidgetView(entry)
            
        default:
            EmptyView()
        }
    }
}
