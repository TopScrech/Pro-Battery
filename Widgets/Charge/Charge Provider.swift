import SwiftUI
import WidgetKit

struct ChargeProvider: AppIntentTimelineProvider {
    func placeholder(
        in context: Context
    ) -> ChargeEntry {
        ChargeEntry(date: Date(), configuration: ChargeConfigIntent())
    }
    
    func snapshot(
        for configuration: ChargeConfigIntent,
        in context: Context
    ) async -> ChargeEntry {
        ChargeEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(
        for configuration: ChargeConfigIntent,
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
