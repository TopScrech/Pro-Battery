import SwiftUI

struct ChargeEntryView: View {
    @Environment(\.widgetFamily) private var family
    
    private let entry: ChargeProvider.Entry
    
    init(_ entry: ChargeProvider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        switch family {
        case .systemSmall, .systemLarge:
            ChargeSmallView(entry)
            
        case .systemMedium, .systemExtraLarge:
            ChargeMediumView(entry)
            
        default:
            EmptyView()
        }
    }
}
