import SwiftUI

struct CyclesEntryView: View {
    @Environment(\.widgetFamily) private var family
    
    private var entry: CyclesProvider.Entry
    
    init(_ entry: CyclesProvider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        switch family {
        case .systemSmall:
            SmallCycleWidgetView(entry)
            
//        case .systemMedium:
            
            
        default:
            EmptyView()
        }
    }
}
