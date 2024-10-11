import SwiftUI
import WidgetKit

struct CyclesWidgets: Widget {
    let kind = "Cycles"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: kind,
            intent: CyclesAppIntent.self,
            provider: CyclesProvider()
        ) { entry in
            CyclesEntryView(entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemSmall])
    }
}
