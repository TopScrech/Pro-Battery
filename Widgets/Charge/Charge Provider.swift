import WidgetKit

struct ChargeProvider: AppIntentTimelineProvider {
    private let info = fetchChargeWidgetInfo()
    
    private var charge: Double {
        info.charge
    }
    
    private var capacity: Int {
        info.capacity
    }
    
    private var cycles: Int {
        info.cycles
    }
    
    private var condition: String {
        info.condition
    }
    
    func placeholder(in context: Context) -> ChargeEntry {
        ChargeEntry(
            date: Date(),
            charge: charge,
            cycles: cycles,
            capacity: capacity,
            condition: condition,
            configuration: ChargeConfigIntent()
        )
    }
    
    func snapshot(
        for configuration: ChargeConfigIntent,
        in context: Context
    ) async -> ChargeEntry {
        ChargeEntry(
            date: Date(),
            charge: charge,
            cycles: cycles,
            capacity: capacity,
            condition: condition,
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
                charge: charge,
                cycles: cycles,
                capacity: capacity,
                condition: condition,
                configuration: configuration
            )
        ]
        
        return Timeline(entries: entries, policy: .atEnd)
    }
    
    //    func relevances() async -> WidgetRelevances<ChargeAppIntent> {
    //        // Generate a list containing the contexts this widget is relevant in
    //    }
}
