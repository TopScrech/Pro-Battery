import SwiftUI
import WidgetKit

struct CapacityWidgets: Widget {
    private let kind = "Max. Capacity"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: CapacityConfigIntent.self, provider: CapacityProvider()) {
            CapacityEntryView($0)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge, .systemExtraLarge])
    }
}
