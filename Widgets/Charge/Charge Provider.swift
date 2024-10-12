import WidgetKit

struct ChargeProvider: AppIntentTimelineProvider {
    private let previewEntry = ChargeEntry(
        date: Date(),
        charge: fetchBatteryLevel(),
        configuration: ChargeConfigIntent()
    )
    
    func placeholder(in context: Context) -> ChargeEntry {
        previewEntry
    }
    
    func snapshot(
        for configuration: ChargeConfigIntent,
        in context: Context
    ) async -> ChargeEntry {
        previewEntry
    }
    
    func timeline(
        for configuration: ChargeConfigIntent,
        in context: Context
    ) async -> Timeline<ChargeEntry> {
        
        let entries = [
            previewEntry
        ]
        
        return Timeline(entries: entries, policy: .atEnd)
    }
    
    //    func relevances() async -> WidgetRelevances<ChargeAppIntent> {
    //        // Generate a list containing the contexts this widget is relevant in
    //    }
}
