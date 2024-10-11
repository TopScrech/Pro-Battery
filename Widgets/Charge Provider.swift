import SwiftUI
import WidgetKit

struct ChargeProvider: AppIntentTimelineProvider {
    func placeholder(
        in context: Context
    ) -> ChargeEntry {
        ChargeEntry(date: Date(), configuration: ChargeAppIntent())
    }
    
    func snapshot(
        for configuration: ChargeAppIntent,
        in context: Context
    ) async -> ChargeEntry {
        ChargeEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(
        for configuration: ChargeAppIntent,
        in context: Context
    ) async -> Timeline<ChargeEntry> {
        var entries: [ChargeEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date
        let currentDate = Date()
        
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(
                byAdding: .hour,
                value: hourOffset,
                to: currentDate
            )!
            
            let entry = ChargeEntry(
                date: entryDate,
                configuration: configuration
            )
            
            entries.append(entry)
        }
        
        return Timeline(entries: entries, policy: .atEnd)
    }
    
    //    func relevances() async -> WidgetRelevances<ChargeAppIntent> {
    //        // Generate a list containing the contexts this widget is relevant in
    //    }
}
