import WidgetKit

struct ChargeProvider: AppIntentTimelineProvider {
    let info = fetchChargeWidgetInfo()
    
    var charge: Double {
        info.charge
    }
    
    var capacity: Int {
        info.capacity
    }
    
    var cycles: Int {
        info.cycles
    }
    
    var condition: String {
        info.condition
    }
    
    var temperature: Double {
        info.temperature
    }
    
    func placeholder(in context: Context) -> ChargeEntry {
        ChargeEntry(
            date: Date(),
            charge: charge,
            cycles: cycles,
            capacity: capacity,
            condition: condition,
            temperature: temperature,
            configuration: ChargeConfigIntent()
        )
    }
    
    func snapshot(for configuration: ChargeConfigIntent, in context: Context) async -> ChargeEntry {
        ChargeEntry(
            date: Date(),
            charge: charge,
            cycles: cycles,
            capacity: capacity,
            condition: condition,
            temperature: temperature,
            configuration: configuration
        )
    }
    
    func timeline(for configuration: ChargeConfigIntent, in context: Context) async -> Timeline<ChargeEntry> {
        let entries = [
            ChargeEntry(
                date: Date(),
                charge: charge,
                cycles: cycles,
                capacity: capacity,
                condition: condition,
                temperature: temperature,
                configuration: configuration
            )
        ]
        
        return Timeline(entries: entries, policy: .atEnd)
    }
    
    //    func relevances() async -> WidgetRelevances<ChargeAppIntent> {
    //        // Generate a list containing the contexts this widget is relevant in
    //    }
}
