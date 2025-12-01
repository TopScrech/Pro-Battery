import SwiftUI
import WidgetKit

struct ChargeWidgets: Widget {
    private let kind = "Charge"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ChargeConfigIntent.self, provider: ChargeProvider()) {
            ChargeEntryView($0)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge, .systemExtraLarge])
    }
}
