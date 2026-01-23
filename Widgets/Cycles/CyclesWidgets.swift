import SwiftUI
import WidgetKit

struct CyclesWidgets: Widget {
    private let kind = "Cycles"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: CyclesConfigIntent.self, provider: CyclesProvider()) {
            CyclesEntryView($0)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge, .systemExtraLarge])
    }
}
