import SwiftUI
import WidgetKit

struct ChargeWidgets: Widget {
    let kind = "Charge"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: kind,
            intent: ChargeAppIntent.self,
            provider: ChargeProvider()
        ) { entry in
            ChargeEntryView(entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
