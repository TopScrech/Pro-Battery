import SwiftUI
import WidgetKit

struct CapacityProvider: AppIntentTimelineProvider {
    func placeholder(
        in context: Context
    ) -> CapacityEntry {
        CapacityEntry(date: Date(), configuration: CapacityConfigIntent())
    }
    
    func snapshot(
        for configuration: CapacityConfigIntent,
        in context: Context
    ) async -> CapacityEntry {
        CapacityEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(
        for configuration: CapacityConfigIntent,
        in context: Context
    ) async -> Timeline<CapacityEntry> {
        var entries: [CapacityEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date
        let currentDate = Date()
        
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(
                byAdding: .hour,
                value: hourOffset,
                to: currentDate
            )!
            
            let entry = CapacityEntry(
                date: entryDate,
                configuration: configuration
            )
            
            entries.append(entry)
        }
        
        return Timeline(entries: entries, policy: .atEnd)
    }
    
    //    func relevances() async -> WidgetRelevances<CapacityConfigIntent> {
    //        // Generate a list containing the contexts this widget is relevant in
    //    }
}
