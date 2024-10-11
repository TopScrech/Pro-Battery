import SwiftUI
import WidgetKit

struct CyclesProvider: AppIntentTimelineProvider {
    func placeholder(
        in context: Context
    ) -> CyclesEntry {
        CyclesEntry(date: Date(), configuration: CyclesAppIntent())
    }
    
    func snapshot(
        for configuration: CyclesAppIntent,
        in context: Context
    ) async -> CyclesEntry {
        CyclesEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(
        for configuration: CyclesAppIntent,
        in context: Context
    ) async -> Timeline<CyclesEntry> {
        var entries: [CyclesEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date
        let currentDate = Date()
        
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(
                byAdding: .hour,
                value: hourOffset,
                to: currentDate
            )!
            
            let entry = CyclesEntry(
                date: entryDate,
                configuration: configuration
            )
            
            entries.append(entry)
        }
        
        return Timeline(entries: entries, policy: .atEnd)
    }
    
    //    func relevances() async -> WidgetRelevances<CyclesAppIntent> {
    //        // Generate a list containing the contexts this widget is relevant in
    //    }
}
