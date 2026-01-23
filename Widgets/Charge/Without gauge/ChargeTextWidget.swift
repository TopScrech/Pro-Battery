import SwiftUI
import WidgetKit

struct ChargeTextWidget: Widget {
    private let kind = "Charge Text"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ChargeTextConfigIntent.self, provider: ChargeTextProvider()) {
            ChargeTextEntryView($0)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge, .systemExtraLarge])
    }
}
