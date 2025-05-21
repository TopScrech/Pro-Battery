import SwiftUI

struct CyclesEntryView: View {
    @Environment(\.widgetFamily) private var family
    
    private let entry: CyclesProvider.Entry
    
    init(_ entry: CyclesProvider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        switch family {
        case .systemSmall:
            CyclesSmallView(entry)
            
        case .systemMedium:
            CyclesMediumView(entry)
            
        default:
            EmptyView()
        }
    }
}
