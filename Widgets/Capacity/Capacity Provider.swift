import WidgetKit

struct CapacityProvider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> CapacityEntry {
        
        CapacityEntry(
            date: Date(),
            capacity: fetchCapacity(),
            configuration: CapacityConfigIntent()
        )
    }
    
    func snapshot(
        for configuration: CapacityConfigIntent,
        in context: Context
    ) async -> CapacityEntry {
        
        CapacityEntry(
            date: Date(),
            capacity: fetchCapacity(),
            configuration: configuration
        )
    }
    
    func timeline(
        for configuration: CapacityConfigIntent,
        in context: Context
    ) async -> Timeline<CapacityEntry> {
        
        let entries = [
            CapacityEntry(
                date: Date(),
                capacity: fetchCapacity(),
                configuration: configuration
            )
        ]
        
        return Timeline(entries: entries, policy: .atEnd)
    }
    
    //    func relevances() async -> WidgetRelevances<CapacityConfigIntent> {
    //        // Generate a list containing the contexts this widget is relevant in
    //    }
}
