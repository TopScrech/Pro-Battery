import SwiftUI
import WidgetKit

struct CapacityWidgets: Widget {
    let kind = "Capacity"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: kind,
            intent: CapacityConfigIntent.self,
            provider: CapacityProvider()
        ) { entry in
            CapacityEntryView(entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemSmall])
    }
}
