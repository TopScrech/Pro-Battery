import SwiftUI

struct CyclesEntryView: View {
    @Environment(\.widgetFamily) private var family
    
    private let entry: CyclesProvider.Entry
    
    init(_ entry: CyclesProvider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        switch family {
        case .systemSmall, .systemLarge:
            CyclesSmallView(entry)
            
        case .systemMedium, .systemExtraLarge:
            CyclesMediumView(entry)
            
        default:
            EmptyView()
        }
    }
}
