import WidgetKit

struct CyclesProvider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> CyclesEntry {
        
        CyclesEntry(
            date: Date(),
            cycles: fetchCycleCount(),
            configuration: CyclesConfigIntent()
        )
    }
    
    func snapshot(
        for configuration: CyclesConfigIntent,
        in context: Context
    ) async -> CyclesEntry {
        
        CyclesEntry(
            date: Date(),
            cycles: fetchCycleCount(),
            configuration: CyclesConfigIntent()
        )
    }
    
    func timeline(
        for configuration: CyclesConfigIntent,
        in context: Context
    ) async -> Timeline<CyclesEntry> {
        
        let entries = [
            CyclesEntry(
                date: Date(),
                cycles: fetchCycleCount(),
                configuration: configuration
            )
        ]
        
        return Timeline(entries: entries, policy: .atEnd)
    }
    
    //    func relevances() async -> WidgetRelevances<CyclesConfigIntent> {
    //        // Generate a list containing the contexts this widget is relevant in
    //    }
}
