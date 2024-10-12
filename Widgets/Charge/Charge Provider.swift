import WidgetKit

struct ChargeProvider: AppIntentTimelineProvider {
    private let previewEntry = ChargeEntry(
        date: Date(),
        charge: fetchBatteryLevel(),
        cycles: fetchCycles(),
        capacity: fetchCapacity(),
        configuration: ChargeConfigIntent()
    )
    
    func placeholder(in context: Context) -> ChargeEntry {
        previewEntry
    }
    
    func snapshot(
        for configuration: ChargeConfigIntent,
        in context: Context
    ) async -> ChargeEntry {
        ChargeEntry(
            date: Date(),
            charge: fetchBatteryLevel(),
            cycles: fetchCycles(),
            capacity: fetchCapacity(),
            configuration: configuration
        )
    }
    
    func timeline(
        for configuration: ChargeConfigIntent,
        in context: Context
    ) async -> Timeline<ChargeEntry> {
        
        let entries = [
            ChargeEntry(
                date: Date(),
                charge: fetchBatteryLevel(),
                cycles: fetchCycles(),
                capacity: fetchCapacity(),
                configuration: configuration
            )
        ]
        
        return Timeline(entries: entries, policy: .atEnd)
    }
    
    //    func relevances() async -> WidgetRelevances<ChargeAppIntent> {
    //        // Generate a list containing the contexts this widget is relevant in
    //    }
}
