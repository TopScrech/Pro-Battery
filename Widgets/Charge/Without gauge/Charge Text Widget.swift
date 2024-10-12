import SwiftUI
import WidgetKit

struct ChargeTextWidget: Widget {
    let kind = "Charge"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: kind,
            intent: ChargeTextConfigIntent.self,
            provider: ChargeTextProvider()
        ) { entry in
            ChargeTextEntryView(entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
