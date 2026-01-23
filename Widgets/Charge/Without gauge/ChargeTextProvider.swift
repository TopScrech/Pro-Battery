import WidgetKit

struct ChargeTextProvider: AppIntentTimelineProvider {
    private let previewEntry = ChargeTextEntry(
        date: Date(),
        charge: fetchBatteryLevel(),
        configuration: ChargeTextConfigIntent()
    )
    
    func placeholder(in context: Context) -> ChargeTextEntry {
        previewEntry
    }
    
    func snapshot(for configuration: ChargeTextConfigIntent, in context: Context) async -> ChargeTextEntry {
        ChargeTextEntry(
            date: Date(),
            charge: fetchBatteryLevel(),
            configuration: configuration
        )
    }
    
    func timeline(for configuration: ChargeTextConfigIntent, in context: Context) async -> Timeline<ChargeTextEntry> {
        let entries = [
            ChargeTextEntry(
                date: Date(),
                charge: fetchBatteryLevel(),
                configuration: configuration
            )
        ]
        
        return Timeline(entries: entries, policy: .atEnd)
    }
    
    //    func relevances() async -> WidgetRelevances<ChargeAppIntent> {
    //        // Generate a list containing the contexts this widget is relevant in
    //    }
}
